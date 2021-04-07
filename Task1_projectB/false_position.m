function c = false_position(a, b, f)

if (f(a) * f(b)) > 0
    disp('Function for given a and b have the same sign.');
    disp('Find different interval');
else

acc = 1e-10;
curr_acc = inf;
it = 1;

while curr_acc > acc
    fa = f(a);
    fb = f(b);
    c(it) = (a * f(b) - b * f(a)) / (f(b) - f(a));
    if ( f(c(it)) == 0)
        break;
    elseif (f(c(it)) * f(a) < 0)
        b = c(it);
    else
        a = c(it);
    end
    
    it = it + 1;
    c(it) = (a * fb - b * fa) / (fb - fa);
    curr_acc = abs(f(c(it)) - f(c(it-1)));
end

disp('Number of iterations');
disp(it);
end
    
    