p = [2 5 -2 3 7];
sym x

% Finding roots using MM1 method.
disp('MM1 method');
r1M1 = MM1(-1, 5, 0, p);
r2M1 = MM1(9, -8, -4, p);
r3M1 = MM1(-10, -5, 0, p);
r4M1 = MM1(0.1, -1, 100000, p);


% Finding roots using MM2 method.
disp('MM2 method');
p0 = [2 5 -2 3 7];
p1 = [8 15 -4 3];
p2 = [24 30 -8];

r1M2 = MM2(p0, p1, p2, 1);
r2M2 = MM2(p0, p1, p2, -1);
r3M2 = MM2(p0, p1, p2, -5);
r4M2 = MM2(p0, p1, p2, 20);


% Finding real roots Newton method.
f = @(x) 2*x^4 + 5*x^3 -2 *x^2 + 3*x + 7;
f_diff = @(x) 8*x^3 + 15*x^2 - 4*x + 3;


disp('Newton method for the same initial points as for MM2 method.');
r2N = newton(-1, f, f_diff);
r3N = newton(-5, f, f_diff);

% Comparing results with matlab fzero() function.
disp('MATLAB roots() function.');
disp(roots(p));


%MM1 plot.
nexttile
fplot(f, [-3, 1]);
hold on
plot(r1M1, f(r1M1), 'o');
hold on
plot(r2M1, f(r2M1), 'o');
hold on
plot(r3M1, f(r3M1), 'o');
hold on
plot(r4M1, f(r4M1), 'o');
legend('f(x)', 'root');
title('MM1');


% MM2 plot.
nexttile
fplot(f, [-3, 1]);
hold on
plot(r1M2, f(r1M2), 'o');
hold on
plot(r2M2, f(r2M2), 'o');
hold on
plot(r3M2, f(r3M2), 'o');
hold on
plot(r4M2, f(r4M2), 'o');
legend('f(x)', 'root');
title('MM2');


% Newton plot.
nexttile
fplot(f, [-3, 1]);
hold on
plot(r2N, f(r2N), 'o');
hold on
plot(r3N, f(r3N), 'o');
legend('f(x)', 'root');
title('Newton method');
