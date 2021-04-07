A = zeros(5,5);
n = 5;
for i=1:n
    for j=1:n
        A(i,j) = i+j;
    end
end

disp(A);

[m, n] = size(A);
Q = zeros(m, n);
R = zeros(m, n);
d = zeros(1, n);

for i=1:n
    Q(:, i) = A(:, i);
    R(i, i) = 1;
    d(i) = Q(:, i)' * Q(:, i);
    
    for j=(i+1):n
        R(i,j) = (Q(:,i)' * A(:,j))/d(i);
        A(:,j) = A(:,j) - R(i,j) * Q(:,i);
    end
end

for i=1:n
    dd = norm(Q(:,i));
    Q(:,i) = Q(:,i)/dd;
    R(i,i:n) = R(i,i:n)*dd;
end

disp('my QR');
disp(Q);
disp(R);
disp(A);

disp('qr');
[Q1, R1] = qr(A);
disp(Q1);
disp(R1);
disp(A);



%{
for i=1:n
    R(i,i) = norm(A(:,i));
    Q(:,i)=A(:,i)/R(i,i);
    for j=(i+1):n
        R(i,j)=Q(:,j)'*A(:,j);
        A(:,j)=A(:,j)-R(i,j)*Q(:,i);
    end
end
%}
