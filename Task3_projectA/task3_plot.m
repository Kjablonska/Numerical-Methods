A = [13 2 -8 1
    1 10 5 -2
    6 2 -23 15
    1 2 -1 13];

B = [16; 24; 184; 82];
D = diag(diag(A));
U = triu(A);
L = tril(A);
    
accuracy = 1e-10;
curr_accuracy = inf; 
iterations = 0;
r = inf;
    
 n = size(A, 1);
 x = zeros(n, 1);
 err = zeros(n, 1);
 it = zeros(n, 1);
 
 while (accuracy < curr_accuracy) && (accuracy < r)
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
    curr_accuracy = norm(x - prev_x);
    r = norm(A*x - B);
    err(iterations) = r;
    it(iterations) = iterations;
 end
 
 
 disp(err);
 disp(iterations);
 
 plot(it, err);

 
 