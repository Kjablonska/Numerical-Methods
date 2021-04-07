function[x] = GaussSeidel(A, B)
    n = size(A, 1);
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
    
    n = size(A, 1);
    x = zeros(n, 1);

    while accuracy < stop1 && accuracy < stop2 && iterations < max_iterations
        prev_x = x;
        for j=1:n
            sum = 0;
            for k=1:(j-1)
                sum = sum + ((L(j,k) + U(j,k)) * x(k)); 
            end
            for k=(j+1):n
                sum = sum + ((L(j,k) + U(j,k)) * prev_x(k));
            end
            x(j,1) = (sum - B(j,1))* (-1/D(j,j));
        end
        iterations = iterations + 1;
        stop1 = norm(prev_x - x);
        stop2 = norm(A * x - B);
        
    end
    
    disp('Iterations');
    disp(iterations);

    if (iterations == max_iterations)
        disp('Program stopped after obtaining max_iterations number.');
    end
        
end