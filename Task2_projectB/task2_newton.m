p = [2 5 -2 3 7];
disp(size(p));
f = @(x) 2*x^4 + 5*x^3 - 2*x^2 + 3*x + 7;

% Calculating drivative of f(x).
syms x
Fx = f(x);
f_d = diff(Fx, x);
f_diff = @(x) 8*x^3 + 15*x^2 - 4*x + 3;

x = newton(1, f, f_diff);
disp(x);

% Checking results. 
r = roots(p);
real_roots = r(imag(r)== 0);
disp(real_roots);