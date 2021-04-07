N = 10;

X = [-5 -4 -3 -2 -1 0 1 2 3 4 5];
Y = [-5.4606 -3.8804 -1.9699 -1.6666 -0.0764 -0.3971 -1.0303 -4.5483 -11.5280 -21.6417 -34.4458]
%X = [0 0.2 0.4 0.6 0.8 1.0];
%Y = [1.12 0.7 0.5 0.4 0.25 0.2];

A = zeros(N+1, N+1);
for i=1:length(X)
    for j=1:(N+1)
        A(i,j) = X(i)^(N+1 -j);
    end
end

disp(A);
disp('Y');
disp(Y');

[Q, R] = QR(A);

disp('Q');
disp(Q');

B = (Q')* (Y');
x = R\B;
disp('X');
disp(x);

disp('Polynomial approximation');
p = poly2sym(x)

disp('Errors');
disp('Euclidean norm of vector of residuum');
r = norm(A * x - Y')

% Checking condition number.
disp('Condition number');
cond_nb = norm((A')) * norm(A);


plot(X,Y);
hold on
fplot(poly2sym(x), [-5,5]);



