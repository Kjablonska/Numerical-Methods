X = [-5 -4 -3 -2 -1 0 1 2 3 4 5];
Y = [-5.4606 -3.8804 -1.9699 -1.6666 -0.0764 -0.3971 -1.0303 -4.5483 -11.5280 -21.6417 -34.4458];


N = [1 2 3 4 5 6 7 8 9 10];

% Comparing solution's error.
for i=1:length(N)
    figure
    r(i) = LLSA(X, Y, N(i));
    s_title = sprintf('Polynomial approximation for degree %d', N(i));
    title(s_title);
    xlabel('X');
    ylabel('Y');
end

figure
plot(N,r);
title('Euclidean norm of vector of residuum');
xlabel('error');
ylabel('Polynomial degree');
