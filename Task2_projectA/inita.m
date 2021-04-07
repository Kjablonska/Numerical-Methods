function[A, B] = inita(n)

A = zeros(n, n);
for i=1:n
    for j=1:n
        if (i == j)
            A(i,j) = 13;
        elseif ((i == j - 1) || (i == j + 1))
            A(i,j) = 4;
        end
    end
end

B = zeros(n, 1);
for i=1:n
   B(i,:) = 2.4 + (0.6 * i); 
end

end