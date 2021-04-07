function res = MM1(x0, x1, x2, p)
accuracy = eps();
max_it = 10000;
curr_acc = inf;
i = 1;

disp('Initial values: ');
disp(x0);
disp(x1);
disp(x2);

while i < max_it && curr_acc > accuracy
    f1 = polyval(p, x0);
    f2 = polyval(p, x1);
    f3 = polyval(p, x2);
    
    d1 = f1 - f3;
    d2 = f2 - f3;
    
    z1 = x0 - x2;
    z2 = x1 - x2;
    
    a0 = f3;
    a1 = (((d2 * z1 * z1) - (d1 * z2 * z2)) / ((z1 * z2) * (z1 - z2))); 
    a2 = (((d1 * z2) - (d2 * z1))/((z1 * z2) * (z1 - z2)));
    
    delta_s = (sqrt(a1 * a1 - 4*a0*a2));
    r1 = (-2*a0) / (a1 + delta_s);
    r2 = (-2*a0) / (a1 - delta_s);
    
    if (abs(x1 + delta_s) >= abs(x1 - delta_s))
        res = r1 + x2;
    else
        res = r2 + x2;
    end
    
    m = res * 100;
    n = x2 * 100;
    if (floor(m) == floor(n))
        break;
    end
    
    curr_acc = abs(x2 -res);
    
    disp(res);
    x0 = x1;
    x1 = x2;
    x2 = res; 
    i = i + 1;
end

disp('Number of iterations:')
disp(i);

disp('Root: ');
disp(res);
