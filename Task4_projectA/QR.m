function [Q,R] = QR(A)

[m, n] = size(A);
d = zeros(1, n);
Q = zeros(m, n);
R = zeros(n, n);

for i=1:n
    Q(:, i) = A(:, i);
    R(i, i) = 1;
    d(i) = Q(:, i)' * Q(:, i);
    
    for j=(i+1):n
        R(i,j) = (Q(:,i)'*A(:,j))/d(i);
        A(:,j) = A(:,j) - R(i,j)*Q(:,i);
    end
end

for i=1:n
    dd = norm(Q(:,i));
    if dd~= 0
    Q(:,i) = Q(:,i)/dd;
    end
    R(i,i:n) = R(i,i:n)*dd;
end

disp(R);