function [x] = gauss(A, B)
C = [A B];
n = size(A, 1);

for k=1:n 
% Finding pivot (max value and return its row position).

% Reseting values for each loop.
max = 0;
index = 0;  

for i=1:n
    if abs(A(i, k)) > max
        max = abs(A(i, k));
        index = i;
     end
end

% Row exchange (index-th with k-th row).
if (index ~= k)
    if (max < A(i,k))
        for i=k:n
            tmp = A(index, i);
            A(index, i) = A(k, i);
            A(k, i) = tmp;
        end
    end
end

% Gaussian elimination.
for i=(k+1):n
    m = A(i, k) / A(k, k);
    %(n+1) because we want to do this calculations also on B part of matrix C = A|B. 
    for j=k:n
        A(i,j) = A(i, j) - (m * A(k, j));
    end
    B(i) = B(i) -B(k) * m;
end

end

% Backward substitution.
x = zeros(n, 1);
x(n, :) = B(n) / A(n, n);
i = n - 1;

while i > 0
    x(i) = (B(i) - A(i, i+1:n) * x(i + 1:n))/A(i, i);
    i = i - 1;
end



