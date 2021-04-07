function res = dxdy(x)

res(1) = (x(2) + x(1) * (0.5 - x(1)^2 - x(2)^2));
res(2) = (-x(1) + x(2) * (0.5 - x(1)^2 - x(2)^2));

end