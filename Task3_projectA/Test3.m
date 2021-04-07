% Task 3.

% General informations about iterative methods for system of linear
% equations.
% sr
% Iterative method for for solving Ax = b are used mostly for problems of
% large dimension and with sparse matrix A.

% Iterative method will work properly with any matrix M and vector w
% satisfying:
% 1) the convergence condition: sr(M) < 1.
% 2) the coincidence condition x = Mx + w


% Jacobi's method

% Decompose matrix A:
% A = L + D + U, where L - subdiagonal matrix, D - diagonal matrix, U - over diagonal
% matrix.
% The system of linear equations Ax = b can be written as: 
% Dx = -(L + U)x + b 
% Assuming that the D matrix is nonsingular the Jacobi's method can be written as:
% x(i+1) = -D^(-1)(L+U)x(i) + D^(-1)b 

% The Jacobi's method is a parallel computation scheme because the Jacobi's
% method can be written in the form of n independent scalar equations.

row1 = [13 2 -8 1];
row2 = [1 10 5 -2];
row3 = [6 2 -23 15];
row4 = [1 2 -1 13];

A = [row1; row2; row3; row4];
disp(A);

B = [16 24 184 82];
B = B';
disp(B);


n = 4;
%{
% Create diagonal matrix D.
D = zeros(n, n);
for i=1:n
   for j=1:n
       if (i == j)
           D(i,j) = A(i,j);
       end
   end
end


% Create subdiagonal matrix L.
L = zeros(n, n);
for i=2:n
   for j=1:(i-1)
       L(i,j) = A(i,j);
   end
end


% Create uperdiagonal matrix U.
U = zeros(n, n);
for i=1:n
   for j=(i+1):n
       U(i,j) = A(i,j);
   end
end
%}

% Decomoposing matrix A.

D = diag(diag(A));
U = triu(A);
L = tril(A);

disp(A);
disp(D);
disp(L);
disp(U);


% Initial results approximations.
accuracy = 1e-10;
curr_accuracy = inf;
iterations = 0;
sum = 0;

x = zeros(n, 1);
while accuracy < curr_accuracy
    prev_x = x;
    for j=1:n
        sum = 0;
        for k=1:n
            if (j~=k)
                sum = sum + (L(j,k) + U(j,k)) * prev_x(k,1); 
            end
        end
        x(j,1) = (sum - B(j,1))* (-1/D(j,j));
    end
    iterations = iterations + 1;
    curr_accuracy = norm(x - prev_x);
end

disp('x');
disp(x);

plot(A*x-B);
disp(A*x-B);
disp(B);
disp(A*x);



while accuracy < curr_accuracy && iterations < max_iterations
    prev_x = x;
    for j=1:n
        sum = 0;
        w = 0;
        for k=1:(j-1)
            sum = sum + ((L(j,k) + U(j,k)) * x(k)); 
        end
        for k=(j+1):n
            sum = sum + ((L(j,k) + U(j,k)) * prev_x(k));
        end
        x(j,1) = (sum - B(j,1))* (-1/D(j,j));
    end
    iterations = iterations + 1;
    curr_accuracy = norm(prev_x - x);
end










% Different version of Jacobi's method implementation - without decomposing
% matrix A.

% With the Jacobi method, the values of x obtained in the kth iteration
% remain unchained unil the entire (k+1)th iteration has been calculated.

% Algorithm:
% While accuracy < current accuracy:
% For i = 1...n calcuate X as:
%   For the first iteration substitute guessed approximation vector and calcualte
%   new approximation.
%   For the next iterations substiute vector calcuted in the previous iteration.

% Assign matrix with the given values.
%{
row1 = [13 2 -8 1];
row2 = [1 10 5 -2];
row3 = [6 2 -23 15];
row4 = [1 2 -1 13];

A = [row1; row2; row3; row4];

B = [16 24 184 82];
B = B';

C = [A B];

n = 4;

% Initial results approximations.
X = zeros(n, 1);

accuracy = 10e-10;
curr_accuracy = 1;
iterations = 0;

while accuracy < curr_accuracy
    prev_x = X;
    
    for i=1:n
        approx = 0;
        
        for j=1:n
            if j ~= i
                approx = approx + A(i, j) * X(j);
            end
        end
        X(i) = (B(i) - approx) / A(i, i);
    end   
    
    iterations = iterations + 1;
    curr_accuracy = norm(prev_x - X);
end

%disp(iterations);
disp(X);
disp(A*X-B);
plot(A*X-B);
%}


















% Task 3.

% General informations about iterative methods for system of linear
% equations.
% sr
% Iterative method for for solving Ax = b are used mostly for problems of
% large dimension and with sparse matrix A.

% Iterative method will work properly with any matrix M and vector w
% satisfying:
% 1) the convergence condition: sr(M) < 1.
% 2) the coincidence condition x = Mx + w


% Jacobi's method

% Decompose matrix A:
% A = L + D + U, where L - subdiagonal matrix, D - diagonal matrix, U - over diagonal
% matrix.
% The system of linear equations Ax = b can be written as: 
% Dx = -(L + U)x + b 
% Assuming that the D matrix is nonsingular the Jacobi's method can be written as:
% x(i+1) = -D^(-1)(L+U)x(i) + D^(-1)b 

% The Jacobi's method is a parallel computation scheme because the Jacobi's
% method can be written in the form of n independent scalar equations.

row1 = [13 2 -8 1];
row2 = [1 10 5 -2];
row3 = [6 2 -23 15];
row4 = [1 2 -1 13];

A = [row1; row2; row3; row4];
disp(A);

B = [16 24 184 82];
B = B';
disp(B);


n = 4;
%{
% Create diagonal matrix D.
D = zeros(n, n);
for i=1:n
   for j=1:n
       if (i == j)
           D(i,j) = A(i,j);
       end
   end
end


% Create subdiagonal matrix L.
L = zeros(n, n);
for i=2:n
   for j=1:(i-1)
       L(i,j) = A(i,j);
   end
end


% Create uperdiagonal matrix U.
U = zeros(n, n);
for i=1:n
   for j=(i+1):n
       U(i,j) = A(i,j);
   end
end
%}
