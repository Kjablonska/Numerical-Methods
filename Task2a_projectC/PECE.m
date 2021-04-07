function [res, t] = PECE(k, interval, init, h)

t(1) = interval(1);
res(1, :) = init;
for j=1:k-1
    res(j+1, :) = RK4_helper(res(j, :), h);
    t(j+1) = t(j) + h;
end

yn0 = @(y, f, h) (y + h * 1/720 * (1901 * f(end, :) - 2774 * f(end -1, :) + 2616 * f(end - 2, :) - 1274 * f(end - 3, :) + 251 * f(end - 4, :)));

% fn0 = f(xn, yn0);
yn = @(y, f, h, fn0) (y + h * 1/1440 * (1427  * f(end, :) - 798 * f(end - 1, :) + 482 * f(end - 2, :) - 173 * f(end - 3, :) + 27 * f(end - 4, :)) + h * 475/1440 * fn0);

% fn = f(xn, yn);

f = zeros(length(res), 2);
x1 = @(x) (x(2) + x(1) * (0.5 - x(1)^2 - x(2)^2));
x2 = @(x) (-x(1) + x(2) * (0.5 - x(1)^2 - x(2)^2));

size = (interval(2) - interval(1)) / h;

for i = k+1:size
    t(i) = t(i-1) + h;
    % P
    P = yn0(res(i-1, :), f(1:i-1, :), h);
    
    % E 
    f(i, 1) = x1(P);
    f(i, 2) = x2(P);
    
    % C
    C = yn(res(i-1, :), f(1:i-1, :), h, f(i, :));
    
    % E
    f(i, 1) = x1(C);
    f(i, 2) = x2(C);
    
    res(i, :) = C;
end
