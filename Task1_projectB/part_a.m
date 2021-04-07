f = @(x) (0.5 .* x .* cos(x)) - log(x);

a = 2;
b = 11;

c1 = false_position(2, 6, f);
c2 = false_position(6, 11, f);
disp(c1);
disp(c2);

r1 = c1(8);
r2 = c2(15);

z1 = fzero(f, 5);
z2 = fzero(f, 7);

disp('Matlab fzero() function around point = 5');
disp(z1);
disp('Matlab fzero() function around point = 7');
disp(z2);

fplot(f, [5, 8]);
hold on
plot(r1, f(r1), 'o');
hold on 
plot(6, f(6), 'x');
hold on
plot(r2, f(r2), 'o');
hold on
fplot(f, [6, 8], 'g');
legend('f(x)', 'root', 'interval');
