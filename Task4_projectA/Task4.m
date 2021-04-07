A = zeros(5,5);
n = 5;

for i=1:n
    for j=1:n
        if i == j
            A(i, j) = 7 - i;
        elseif i == j - 1 ||  i == j + 1
            A(i, j) = 1;
        else
            A(i,j) = i + j;
        end
    end
end
disp('Initial matrix');
disp(A);

% Checking ia matrix is symmetric.
if issymmetric(A) == 0
    error('Matrix A is not symmetric. Can not proceed.');
else
    disp('Matrix A symmetric.');
end

cond_nb = norm(inv(A)) * norm(A);
disp('Condition number');
disp(cond_nb);

eigen_s = QR_shifts(A);
disp('Eigenvalues');
disp(eigen_s);

eigen_ns = QR_no_shift(A);
disp('Eigenvalues');
disp(eigen_ns);

disp('MATLAB function eig()');
disp(eig(A));