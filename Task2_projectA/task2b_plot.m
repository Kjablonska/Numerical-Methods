tic
size = [10, 20, 40, 80, 160, 320, 640, 1280];
r = zeros(length(size), 1);

for i=1:length(size)
    [A,B] = initb(size(i));
    C = [A B];
    x = Gauss_partial_pivoting(C);
    r(i) = norm(A*x -B);
end

disp(r);
plot(size, r);
toc