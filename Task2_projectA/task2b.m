tic
n = 10;
[A, B] = initb(n);

C = [A B];
x = Gauss_partial_pivoting(C);

disp('Result');
disp(x);
toc

disp('Error');
r = norm(A * x - B);
disp(r);

disp('Checking solution');
disp(A\B);


for i=1:20
    if i ==1
        disp('Residual correction');
        x1 = Gauss_partial_pivoting(C);
        r1  = A * x1 - B;
        D = [A r1];
        dx = Gauss_partial_pivoting(D);
        x2 = x1 - dx;
        r2 = A * x2 - B;
        rr(i) = norm(r2);
    else
        C = [A B];
        x = Gauss_partial_pivoting(C);
        B = A*x - B;
        rr(i, 1) = norm(A*x - B);
    end
    disp("r" + i + " = " + rr(i, 1));
end