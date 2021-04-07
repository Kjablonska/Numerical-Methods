function [x] = Gauss_partial_pivoting(C)
n = size(C, 1);

for k=1:n 
% Finding pivot (max value and return its row position).

% Reseting values for each loop.
max = 0;
index = 0;  

for i=1:n
    if abs(C(i, k)) > max
        max = abs(C(i, k));
        index = i;
     end
end

% Row exchange (index-th with k-th row).
if (index ~= k)
    if (max < C(i,k))
        for i=k:n+1
            tmp = C(index, i);
            C(index, i) = C(k, i);
            C(k, i) = tmp;
        end
    end
end

% Gaussian elimination.
for i=(k+1):n
    m = C(i, k) / C(k, k);
    %(n+1) because we want to do this calculations also on B part of matrix C = A|B. 
    for j=k:(n+1)
        C(i,j) = C(i, j) - (m * C(k, j));
    end
end


end

% Backward substitution.
x = zeros(n, 1);
x(n, :) = C(n, n +1) / C(n, n);
i = n - 1;

while i > 0
    x(i) = (C(i, n+1) - C(i, i+1:n) * x(i + 1:n))/C(i, i);
    i = i - 1;
end

