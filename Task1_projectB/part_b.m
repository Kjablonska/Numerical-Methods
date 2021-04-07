f = @(x) 0.5 * x * cos(x) - log(x);

% Calculating drivative of f(x).
syms x
Fx = f(x);
f_d = diff(Fx, x);

f_diff = @(x) cos(x)/2 - (x*sin(x))/2 - 1/x;

x1 = newton(5, f, f_diff);
x2 = newton(7, f, f_diff);


fplot(f, [5, 8]);
hold on
plot(x1, f(x1), 'o');
hold on
plot(x2, f(x2), 'o');
legend('f(x)', 'root');
