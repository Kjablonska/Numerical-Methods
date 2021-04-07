function[A, B] = residual_correctionB(x, n)

A = zeros(n,n);
for i=1:n
    for j=1:n 
        A(i,j) = 4 / (5 * (i + j - 1));
    end
end

for i=1:n
    for j=1:n
        A(i,j) = A(i,j) - A(i,j) * x(i);
    end
end


B = zeros(n, 1);
for i=1:n
    if (mod(i, 2) ~= 0)
        B(i,:) = 1 / (2 * i);
    else
        B(i,:) = 0;
    end
end

end