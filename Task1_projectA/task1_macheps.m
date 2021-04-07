macheps = double(1.0);
prev_macheps = macheps;

while(1 < (1 + macheps))
    prev_macheps = macheps;
    macheps = macheps / 2;
end

disp('My macheps function: ');
disp(prev_macheps);

disp('MATLAB macheps function: ');
disp(eps);