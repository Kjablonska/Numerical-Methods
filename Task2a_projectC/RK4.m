function [x, err, t] = RK4(interval, init, h)

size = (interval(2) - interval(1)) / h;
size = round(size)
x = zeros(size, 2);
x(1, :) = RK4_helper(init, h);
t(1) = interval(1);

for i=1:size-1
    x(i+1, :) = RK4_helper(x(i, :), h);
    t(i+1) = t(i) + h;
    
    x_er1(:) = RK4_helper(x(i, :), h/2);
    x_er2(i+1, :) = RK4_helper(x_er1, h/2); 
    err(i, :) = abs(x_er2(i+1, :) - x(i+1, :)) / (2.^4 - 1);
end

end