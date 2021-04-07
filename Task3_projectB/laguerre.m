function [xk] = laguerre(p0, p1, p2, xk)

disp('Initial point');
disp(xk);

i = 0;
max_it = 100;
accuracy = 1e-10;
curr_acc = inf;
n = 4;

while i < max_it && curr_acc > accuracy
    c = polyval(p0, xk);
    b = polyval(p1, xk);
    a = polyval(p2, xk) / 2;

    s = sqrt((n-1)*((n-1)*(b*b - n*2*a*c)));

    z1 = xk - (n * c / (b + s));
    z2 = xk - (n * c / (b - s));


    if (abs(b + s) >= abs(b - s))
        y = z1;
    else
        y = z2;
    end
    curr_acc = abs(xk - y);
    disp(y);
    xk = y;
    i = i + 1;
end

disp('Iterations');
disp(i);
disp(xk);