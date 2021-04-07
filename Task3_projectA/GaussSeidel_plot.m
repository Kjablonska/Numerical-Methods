tic
A = [13 2 -8 1
    1 10 5 -2
    6 2 -23 15
    1 2 -1 13];

check_conditions(A);

B = [16; 24; 184; 82];


D = diag(diag(A));
    U = triu(A);
    L = tril(A);
    
    M = -inv(D+L) * U;

    SR = max(abs(eig(M)));
    disp('SR');
    disp(SR);

    if (SR < 1)
        disp('Spectral radius condition fulfilled, SR(M) < 1.');
    else
        disp('Spectral radius condition not fullfiled. Necessary condition not fulfilled, can not proceed.');
    end
    
    accuracy = 10e-10;
    stop1 = inf;
    stop2 = inf;
    iterations = 0;
    max_iterations = 1000;
    err = zeros(n, 1);
    it = zeros(n, 1);
    
    n = 4;
    x = zeros(n, 1);

    while accuracy < stop1 && accuracy < stop2 && iterations < max_iterations
        prev_x = x;
        for j=1:n
            sum = 0;
            for k=1:n
                if (j~=k)
                    sum = sum + (L(j,k) + U(j,k)) * prev_x(k,1); 
                end
            end
            x(j,1) = (sum - B(j,1)) * (-1/D(j,j));
        end
        iterations = iterations + 1;
        stop1 = norm(prev_x - x);
        stop2 = norm(A * x - B);
        r = norm(A*x - B);
        err(iterations) = r;
        it(iterations) = iterations;
        
    end
    
     disp('Number of iterations');
    disp(iterations);
    disp('Errors');
    disp(err);
    plot(it, err);
    if (iterations == max_iterations)
        disp('Program stopped after obtaining max_iterations number.');
    end

