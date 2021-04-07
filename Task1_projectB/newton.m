function [x] = newton(x, f, f_d)

acc = 1e-10;
curr_acc = inf;
it = 1;
max_it = 100;
disp('Initial point:');
disp(x);

while curr_acc > acc && it < max_it
    x(it + 1) = x(it) - (f(x(it)) / f_d(x(it)));
    curr_acc = abs(x(it+1) - x(it));
    it = it + 1;
end

disp('Number of iterations');
disp(it - 1);
disp(x);
x = x(it);
disp(x);