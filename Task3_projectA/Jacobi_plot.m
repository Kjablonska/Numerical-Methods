
A = [13 2 -8 1
    1 10 5 -2
    6 2 -23 15
    1 2 -1 13];

check_conditions(A);

B = [16; 24; 184; 82];

x1 = GaussSeidel(A, B);
disp(x1);

x2 = Jacobi(A, B);
disp(x2);












