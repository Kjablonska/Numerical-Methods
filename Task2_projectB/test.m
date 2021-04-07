% function x = MM1(pol)
accuracy = 1e-8;
max_it = 10;
i = 1;
j = 1;

curr_acc = inf;

p = [2 5 -2];
x = [1 2 3];

% for i=1:size(pol)
%    A(i) = A(i) + pol(i) * (x^(i-1));
%end

%p = poly2sym(pol);
%disp(p);


while i < 5
    [row, col] = size(pol);
    z0 = x(i) - x(i + 2);
    z1 = x(i+1) - x(i + 2);
    
    % y(z) = az^2 + bz + c
    % Calucating values a, b and c.
    c = polyval(p, x(i+2));
    disp(c);
    n = polyval(p, x(i+1)) - polyval(p, x(i+2));
    
    a = (polyval(p, x(i+1)) - polyval(p, x(i+2))) / (z1 * z1 - z0) - (polyval(p, x(i)) - polyval(p, x(i + 2))) / (z0 * (z1*z1-z0));
    disp(a);
    b = (polyval(p, x(i)) - polyval(p, x(i+2))) / z0 - a * z0;
    disp(b);
    
    delta_s = sqrt(b^2 - (4 * a * c));
    zp1 = -2*c / (b + delta_s);
    zp2 = -2*c / (b - delta_s);
    
    %disp(i);
    %disp(zp1);
    %disp(zp2);
    
    % Calculating a new root.
    if (abs(b + delta_s) >= abs(b - delta_s))
        x(i+3) = x(i+2) + zp1;
        
    else
        x(i+3) = x(i+2) + zp2;
    end
    res = x(i+3);
    
    % Chosing two more roots between x0, x1, x2.
    if (abs(x(i) - x(i+3)) < abs(x(i+1) - x(i+3)))
        ch1 = x(i);
        if (abs(x(i+1)-x(i+3)) < abs(x(i+2) - x(i+3)))
            ch2 = x(i+1);
        else
            ch2 = x(i+2);
        end
    else
        ch1 = x(i+1);
        if (abs(x(i) - x(i+3)) < abs(x(i+2) - x(i+3)))
            ch2 = x(i);
        else
            ch2 = x(i+2);
        end
    end
    
    if (i > 1)
       % curr_acc = abs(x(i+2) - x(i)) / x(i);
       % disp(curr_acc);
    end
    
    i = i + 3;
    x(i+2) = x(i);
    x(i) = ch1;
    x(i+1) = ch2;
    
end

disp('res');
disp(res);













    if (abs(x0 - res) < abs(x1 - res))
        if (x2 - res) < abs(x1 - res)
            x1 = x2;
        end
    end