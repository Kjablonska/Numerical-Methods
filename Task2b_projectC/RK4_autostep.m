function [res, h, err, t, counter] = RK4_autostep(interv, init, B, s, h_min, ew, eb)
p = 4;

hn = 0.1;
hn(1) = hn;
res(1, :) = init;
err(1, :) = [0, 0];
h_max = 0.001;

res = init;
t = interv(1);
i = 1;
counter = 0;

while t(i) ~= interv(2)
    x1 = RK4_helper(res(i, :), hn);
    x2 = RK4_helper(res(i, :), hn/2);
    
    delta = abs((x2 - x1)) / (2.^p - 1);
    e = abs(x2) * ew + eb;
    err(i, :) = delta;
    a = (min(e./delta))^(1/(p+1));
    hn1_star = s * a * hn;
    
    if s * a >= 1
        t(i+1) = t(i) + hn/2;
        res(i+1, :) = x2;
        hn1 = min([hn1_star, B * hn, interv(2) - t(i+1)]);
        hn = hn1;
        i = i + 1;
    else
        if hn1_star < h_min
            disp('Solution not possible with assumed accuracy.');
            break;
        else
            hn = hn1_star;
        end
    end
    counter = counter + 1;
    h(i) = hn;
end

end