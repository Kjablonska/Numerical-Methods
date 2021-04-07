n = 3;
A = zeros(n, n);

for i=1:n
    for j=1:n 
        A(i,j) = 4 / (5 * (i + j - 1));
    end
end

disp(A);


b = zeros(n, 1);
for i=1:n
    if (mod(i, 2) ~= 0)
        b(i,:) = 1 / (2 * i);
    else
        b(i,:) = 0;
    end
end

disp(b);

C = [A b];


r = zeros(n, 1); % Initialize permutation vector
for i = 1 : 1 : n    
   r(i) = i;
end



x = zeros(n, 1); % Initialize solution vector
for k = 1 : 1 : n % Go through each element in permutation vector    
    % Compare each element in r(k)th column for the max
    max = abs(A(r(k), r(k)));    
    max_pos = k;    
    for l = k : 1 : n        
        if abs(A(r(l), r(k))) > max            
            max = abs(A(r(l), r(k)));            
            max_pos = l;            
        end
    end
    disp('###');
    disp(max_pos);
    disp(A);
    
    % Switch the kth r-vector element with max r-vector element
    temp_r = r;
    r(k) = temp_r(max_pos);
    r(max_pos) = temp_r(k);
    
    disp('switched');
    disp(A);
    
    % Eliminate A-vector elements in r(k)th column below r(k)th row        
    %for i = 1 : 1 : n
    for i= (k+1) : n
        %if i ~= k
            zeta = A(r(i), k) / A(r(k), k);
            for j = k : 1 : n
                A(r(i), j) = A(r(i), j) - A(r(k), j) * zeta;                       
            end
            b(r(i)) = b(r(i)) - b(r(k)) * zeta;
        %end
    end
    disp('gaus');
    disp(A);
end





disp(A);
disp(b);
disp(x);


%{
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
    for i=k:n
       tmp = C(index, i);
       C(index, i) = C(k, i);
       C(k, i) = tmp;
    end
end

% Gaussian elimination.
for i=(k+1):n
    m = C(i, k) / C(k, k);
    %(n+1) because we want to do this calsuations also on B part of matrix C = A|B. 
    for j=k:(n+1)
        C(i,j) = C(i, j) - (m * C(k, j));
    end
end

end

disp("Result matrix: ");
disp(C);

% Backward substitution.
x = zeros(n, 1);
x(n, :) = C(n, n +1) / C(n, n);
i = n - 1;

while i > 0
    x(i) = (C(i, n+1) - C(i, i+1:n) * x(i + 1:n))/C(i, i);
    i = i - 1;
end

disp('Result = ');
disp(x);


R = (A * x) - B;
disp(R);
%}




A = zeros(size(C,1), size(C,1));
b = zeros(size(C,1), 1);
for i=1:size(C, 1)
    for j=1:size(C, 1)
        A(i,j) = C(i,j);
    end
    b(i) = C(i, size(C, 2));
end



