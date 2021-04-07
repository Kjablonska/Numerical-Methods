function [rA, rG, cn] = LLSA(X, Y, N)
disp('Polynomial degree');
disp(N);

% Calculating matrix A.
for i=1:length(X)
    for j=1:(N+1)
        A(i, j) = X(i)^(j-1);
    end
end
% Calucalting QR decomposition of matrix A.
[Q, R] = QR(A);
B = (Q')*(Y');
disp('Result');

% Calculating solution error using backward subsitution method.
n = length(B);
x = zeros(n, 1);
x(n, :) = B(n) / R(n,n);
i = n-1;

while i > 0
    x(i) = (B(i) - R(i, i+1:n) * x(i+1:n)) / R(i,i);
    i = i - 1;
end


disp('Errors');
disp('Euclidean norm of vector of residuum');
rA = norm((A * x) - Y');

disp('Condition number of Gram matrix');
cn = cond(A'*A);
rG = norm(A'*Y' - A' * A * x);

x = flip(x);
disp('Polynomial approximation');
p = poly2sym(x)


% plot(X, Y, 'o')
% hold on;
% fplot(poly2sym(x), [-5,5]);
% hold on;




