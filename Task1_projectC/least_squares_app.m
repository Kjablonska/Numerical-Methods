function [r, cn] = least_squares_app(X, Y, N)

sum = 0;

%Calculating G matrix.
G = zeros(N+1,N+1);
for i=1:(N+1)
    for k=1:(N+1)
        for j=1:length(X)
            sum = sum + (X(j))^(i+k-2);
        end
        G(i,k) = sum;
        sum = 0;
    end
end
disp('G matrix');
disp(G);

% Calculating Q matrix.
q = zeros(N+1, 1);
for k=1:(N+1)
    for j=1:length(X)
        sum = sum + Y(j) * (X(j))^(k-1);
    end
    q(k) = sum;
    sum = 0;
end

% QR decomposition of G matrix.

[Q, R] = QR(G);

b = (Q') * q;
x = R\b;

disp('Result');
disp(x);

x = flip(x);
% disp('Polynomial approximation');
p = poly2sym(x);

disp('Errors');
disp('Euclidean norm of vector of residuum');
r = norm(G * x - q)

% Checking condition number.
disp('Condition number');
cn = norm(inv(G)) * norm(G)
% cond(A)

plot(X, Y, 'o');
hold on;
fplot(poly2sym(x), [-5,5]);

end


