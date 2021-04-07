function xk = MM2(p0, p1, p2, xk)

i = 0;
max_it = 100;
accuracy = 1e-10;
curr_acc = inf;

disp('Initial point:');
disp(xk);

while i < max_it && curr_acc > accuracy
    c = polyval(p0, xk);
    b = polyval(p1, xk);
    a = polyval(p2, xk) / 2;

    s = sqrt(b*b - 2*2*a*c);

    z1 = -2 * c / (b + s);
    z2 = -2 * c / (b - s);


    if (abs(b + s) >= abs(b - s))
        y = xk + z1;
    else
        y = xk + z2;
    end
    curr_acc = abs(xk - y);
    disp(y);
    xk = y;
    i = i + 1;
end

disp('Iterations');
disp(i);
disp(xk);