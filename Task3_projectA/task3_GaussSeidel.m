disp('Problem 2b using Gauss-Seidel iterative algorithm.');
[A, B] = initb(10);
check_conditions(A);
GS = GaussSeidel(A, B);
disp('Solution');
disp(GS);
disp('Error');
disp(norm(A * GS - B));

disp('Problem 2b using Jacobi iterative algorithm.');
[A, B] = initb(10);
check_conditions(A);
J = Jacobi(A, B);
disp('Solution');
disp(GS);
disp('Error');
disp(norm(A * GS - B));

disp('Problem 2b using Gauss with partial pivoting algorithm.');
[A, B] = initb(10);
C = [A B];
piv = Gauss_partial_pivoting(C);
disp('Solution');
disp(GS);
disp('Error');
disp(norm(A * GS - B));

size = [10, 20, 40, 80, 160, 320, 640, 1280];
r_GS = zeros(length(size), 1);
r_piv = zeros(length(size), 1);
r_J = zeros(length(size), 1);

for i=1:length(size)
    [A,B] = inita(size(i));
    C = [A B];
    x_GS = GaussSeidel(A, B);
    r_GS(i) = norm(A*x_GS -B);
    x_J = Jacobi(A, B);
    r_J(i) = norm(A*x_J -B);
    x_piv = Gauss_partial_pivoting(C);
    r_piv(i) = norm(A*x_GS -B);
end

disp(r_GS);
disp(r_piv);

% Top plot
nexttile
plot(size, r_GS);
title('GaussSeidel')

nexttile
plot(size, r_J);
title('Jacobi')

% Bottom plot
nexttile
plot(size, r_piv);
title('Gauss with partial pivoting');