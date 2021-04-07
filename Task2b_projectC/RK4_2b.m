interval = [0 15];
init = [10 0];
B = 2;
s = 0.9;

er = 1e-6
ea = 1e-6
hmin = 1e-9

tic
[res, h, delta, t, cnt] = RK4_autostep(interval, init, B, s, hmin, er, ea);
toc

disp('Last step size');
disp(h(length(h)-1));

disp('Total number of iterations');
disp(cnt);

% Calcuating result using MATLAB ode45() function.
[t_45,x_45] = ode45(@fun, interval, init);

% MATLAB ode45() method.
figure(1);
plot(x_45(:,1),x_45(:,2));
title("ode45");

% Plot of obtained result.
figure(2);
plot(res(:,1),res(:,2));
title('Problem solution');

% MATLAB ode45() versus obtained result.
figure(3);
plot(res(:,1),res(:,2), '--');
hold on
plot(x_45(:,1),x_45(:,2));
hold off
title('Problem solution versus ode45()');
legend('res', 'ode45');

% Problem solution versus time.
figure(4);
plot(t, res(:, 1));
hold on
plot(t, res(:, 2));
hold off
xlabel('t');
ylabel('x');
legend('x1', 'x2');
title('Problem solution versus time');

figure(5);
plot(t, res(:, 1));
hold on
plot(t, res(:, 2));
hold on
plot(t_45, x_45(:, 1), '--');
hold on
plot(t_45, x_45(:, 2), '--');
hold off
xlabel('t');
ylabel('x');
legend('x1', 'x2', 'x1 ode', 'x2 ode');
title('ode45() solution and obtained solution versus time');

figure(6);
plot(t, h);
xlabel('t');
ylabel('h');
title('Step size  versus time');

figure(7);
plot(t, [NaN, NaN; delta]);
xlabel('t');
ylabel('delta');
title('Solution error versus time');


% % Different h_min and tolerances values.
% er1 = 1e-3
% ea1 = 1e-3
% hmin1 = 1e-5
% 
% tic
% [res1, h1, delta1, t1, cnt1] = RK4_autostep(interval, init, B, s, hmin1, er1, ea1);
% toc
% 
% disp('Last step size');
% disp(h1(length(h1)-1));
% 
% disp('Total number of iterations');
% disp(cnt1);
% 
% figure(8);
% hold on
% plot(t, [NaN, NaN; delta]);
% hold on
% plot(t1, [NaN, NaN; delta1], '--');
% hold off
% xlabel('t');
% ylabel('delta');
% legend('delta x1', 'delta x2', 'delta1 x1', 'delta1 x2');
% title('Solution error versus time');
% 
% figure(9);
% plot(t, h);
% hold on
% plot(t1, h1, '--');
% hold off
% xlabel('t');
% ylabel('h');
% legend('t', 't1');
% title('Step size versus time');


function dxdt = fun(t,x)
    dxdt = zeros(2,1);
    dxdt(1) = x(2) + x(1) * (0.5 - x(1)^2 - x(2)^2);
    dxdt(2) = -x(1) + x(2) * (0.5 - x(1)^2 - x(2)^2);
end