% System form task 3.
A = [13 2 -8 1
    1 10 5 -2
    6 2 -23 15
    1 2 -1 13];

B = [16; 24; 184; 82];
C = [A B];
disp(C);
check_conditions(A);

disp('System solved using Jacobi iterative algorithm.');
J = Jacobi(A, B);
disp(J);
rJ = norm(A*J - B);
disp(rJ);

disp('System solved using Gauss-Seidel iterative algorithm.');
GS = GaussSeidel(A, B);
disp(GS);
rGS = norm(A*GS - B);
disp(rGS);