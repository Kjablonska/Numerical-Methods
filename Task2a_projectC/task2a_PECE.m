H = [0.02, 0.018, 0.0169, 0.0129, 0.01, 0.008, 0.005, 0.003, 0.001];
init = [10 0];
interval = [0 15];
max_iter = length(H);

% res = zeros(length(H), 2);
% er = zeros(length(H), 2);
% [x, err, tt] = PECE([0 15], init, H(1));
% res(1, :) = x(end, :);
% er(1, :) = err(1, :);
% t(1) = tt(end);
% r = zeros(length(H) - 1, 2);
% 
% for i = 2:length(H)
%     [x, err, tt] = RK4(interval, init, H(i));
%     res(i, :) = x(end, :);
%     t(i) = tt(end);
%     r(i-1, :) = abs(res(i, :) - res(i-1, :));
%     er(i, :) = err(end, :);
% end
% 
% disp(size(t));
% disp(size(res));
% disp('r');
% disp(r);
% 750
% disp('res');
% disp(res);
% 
% disp('err');
% disp(er);

tic
% Recalculating result for the chosen optimal step size.
[x_opt, t] = PECE(5, interval, init, 0.001);
toc

% Recalculating result for the step size greater than the chosen optimal
% step size.
[x_g, t_g] = PECE(5, interval, init, 0.02);


disp(size(x_opt));

figure(52);
plot(t, x_opt(:,1));
hold on
plot(t, x_opt(:,2));
hold off
xlabel('t');
ylabel('solution');
title('optimal solution versus time');

figure(62);
plot(t_g, x_g(:,1));
hold on
plot(t_g, x_g(:,2));
hold off
xlabel('t');
ylabel('solution');
title('not optimal solution versus time');


figure(72);
plot(t, x_opt(:,1));
hold on
plot(t, x_opt(:,2));
hold on
plot(t_g, x_g(:,1), '--');
hold on
plot(t_g, x_g(:,2), '--');
hold off
xlabel('t');
ylabel('solution');
legend('x1 optimal', 'x2 optimal', 'x1 not optimal', 'x2 not optimal'); 
title('optimal and not optimal solution versus time');


[t_45,x_45] = ode45(@fun, interval, init);

% MATLAB ode45() method.
figure(12);
plot(x_45(:,1),x_45(:,2));
title("ode45");

% Result for the chosen optial h.
figure(22);
plot(x_opt(:,1),x_opt(:,2));
title("Adams for not optimal step size");

% ode45() and RK4(h_optimal) comparison.
figure(32);
plot(x_opt(:,1),x_opt(:,2), '--');
hold on
plot(x_45(:,1),x_45(:,2), '--');
hold off
legend('optimal h', 'ode45');
title("Adams and ode45 comparison.");

figure(111112);
plot(t, x_opt(:,1));
hold on
plot(t, x_opt(:,2));
hold on
plot(t_45, x_45(:,1), '--');
hold on
plot(t_45, x_45(:,2), '--');
hold off
xlabel('t');
ylabel('solution');
legend('x1 optimal', 'x2 optimal', 'x1 ode45', 'x2 ode45'); 
title('optimal and ode45() solution versus time');

figure(1112);
plot(x_g(:,1),x_g(:,2));
title("Adams for not optimal step size");

% 
% h > h_optimal && h_optimal comparison.
figure(4);
plot(x_g(:,1), x_g(:,2), '--');
hold on
plot(x_opt(:,1), x_opt(:,2), '--');
hold off
title('Result for h > h optimal');
legend('h > h optimal', 'h optimal');

% 
% figure(7);
% plot(1:1:length(er), er(:,1))
% hold on
% plot(1:1:length(er), er(:,2));
% hold off
% xlabel('i');
% ylabel('error');
% title("Error vs step size");
% 
% figure(8)
% plot(1:length(r), r);
% xlabel('i')
% ylabel('r = abs(res(i, :) - res(i-1, :))');
% title("Accuracy");

function dxdt = fun(t,x)
    dxdt = zeros(2,1);
    dxdt(1) = x(2) + x(1) * (0.5 - x(1)^2 - x(2)^2);
    dxdt(2) = -x(1) + x(2) * (0.5 - x(1)^2 - x(2)^2);
end