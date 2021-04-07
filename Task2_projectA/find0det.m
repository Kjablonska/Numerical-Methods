disp('Part b');
n = 3;
[A, B] = initb(n);
while (det(A) ~= 0)
    n = n + 1;
    [A, B] = initb(n);
    disp(det(A));
end

disp('Size of the matrix A, when det(A) starts beign rounded to 0');
disp(n);

n = 3;
[A, B] = inita(n);

disp('Part a');
while n < 1280
    n = n + 1;
    [A, B] = inita(n);
    if det(A) == 0
        printf("Part a) det(A) == 0 for size = %d", n);
    end
end