function[eigenvalues] = QR_no_shift(A)

tol = 10e-6;
imax = 10000;
it = 1;

while (it <= imax) && (max(max(A-diag(diag(A)))) > tol)
    [Q, R] = QR(A);
    A = R * Q;
    it = it + 1;
end

if it > imax
    error('imax exceeded. Can not proceed.');
end

eigenvalues = diag(A);

disp('QR method for finding eigenvalues without shifts');
disp('Final matrix');
disp(A);
disp('Number of iterations');
disp(it);