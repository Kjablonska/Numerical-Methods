H = [0.02, 0.018, 0.016, 0.015, 0.01, 0.008, 0.005, 0.003, 0.001];
init = [10 0];
interval = [0 15];
k = 5;

res = zeros(length(H), 2);

x = PECE(k, init, interval, H(1));
res(1, :) = x(end, :);
r = zeros(length(H) - 1, 2);

for i = 2:length(H)   
    x = PECE(k, init, interval, H(i));
    res(i, :) = x(end, :);
    r(i-1, :) = abs(res(i, :) - res(i-1, :));
end

disp(r);
disp('res');
disp(res);

% Recalculating result for the chosen optimal step size.
tic
x_opt = PECE(k, init, interval, 0.01);
toc
[x_optR, err_opt] = RK4(interval, init, 0.01);


x_g = PECE(k, init, interval, 0.02);

[t,x_45] = ode45(@fun, 0:0.01:15, [10,0]);

% MATLAB ode45() method.
figure(1);
plot(x_45(:,1),x_45(:,2), '--');
hold on
plot(x_opt(:,1),x_opt(:,2), '--');
hold on
plot(x_optR(:,1),x_optR(:,2), '--');
title("RK4 vs PECE vs ode45 for optimal step-size");
legend('ode45', 'PECE', 'RK4');
% 
% % Result for the chosen optial h.
% figure(2);
% plot(x_opt(:,1),x_opt(:,2));
% title("RK4 for optial h = 0.01");
% 
% % ode45() and RK4(h_optimal) comparison.
% figure(3);
% plot(x_opt(:,1),x_opt(:,2), '--');
% hold on
% plot(x_45(:,1),x_45(:,2), '--');
% hold off
% legend('optimal h', 'ode45');
% title("RK4 and ode45 comparison.");
% 
% % h > h_optimal && h_optimal comparison.
% figure(4);
% plot(x_g(:,1), x_g(:,2), '--');
% hold on
% plot(x_opt(:,1), x_opt(:,2), '--');
% hold off
% title('Result for h > h optimal');
% legend('h > h optimal', 'h optimal');
% 
% figure(5);
% plot(1:1:length(x_opt), x_opt(:,1));
% hold on
% plot(1:1:length(x_opt), x_opt(:,2));
% hold off
% title('optial solution versus time');
% 
% figure(6);
% plot(1:1:length(x_g), x_g(:,1));
% hold on
% plot(1:1:length(x_g), x_g(:,2));
% hold off
% title('not optimal solution versus time');
% 
% figure(8)
% plot(1:length(r), r);
% xlabel('i')
% ylabel('r = abs(res(i, :) - res(i-1, :))');
% title("Accuracy");

function dxdt = fun(t, x)
    dxdt = zeros(2,1);
    dxdt(1) = x(2) + x(1) * (0.5 - x(1)^2 - x(2)^2);
    dxdt(2) = -x(1) + x(2) * (0.5 - x(1)^2 - x(2)^2);
end