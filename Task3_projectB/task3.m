% p0 represnts the given polynomial.
p0 = [2 5 -2 3 7];

% The first derivative of p0.
p1 = [8 15 -4 3];

% The second derivative of p0.
p2 = [24 30 -8];


% disp('Laguerre method');
% r1 = laguerre(p0, p1, p2, 1);
% r2 = laguerre(p0, p1, p2, -1);
% r3 = laguerre(p0, p1, p2, -3);
% r4 = laguerre(p0, p1, p2, 11);

disp('MM2 method');
p0 = [2 5 -2 3 7];
p1 = [8 15 -4 3];
p2 = [24 30 -8];

% r1M2 = MM2(p0, p1, p2, 1);
% r2M2 = MM2(p0, p1, p2, -1);
r3M2 = MM2(p0, p1, p2, -3);
r4M2 = MM2(p0, p1, p2, 11);

% p = [2 5 -2 3 7];
% sym x
% f = @(x) ((2*x.^4) + (5*x.^3) -(2*x.^2) + 3*x + 7);
% 
% nexttile
% fplot(f, [-3, 1]);
% hold on
% plot(r1, f(r1), 'o');
% hold on
% plot(r2, f(r2), 'o');
% hold on
% plot(r3, f(r3), 'o');
% hold on
% plot(r4, f(r4), 'o');
% title('MM2');
% 
% nexttile
% fplot(f, [-3, 1]);
% hold on
% plot(r1M2, f(r1M2), 'o');
% hold on
% plot(r2M2, f(r2M2), 'o');
% hold on
% plot(r3M2, f(r3M2), 'o');
% hold on
% plot(r4M2, f(r4M2), 'o');
% title('Laguerre');
