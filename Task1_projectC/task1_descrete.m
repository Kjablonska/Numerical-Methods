
X = [-5 -4 -3 -2 -1 0 1 2 3 4 5];
Y = [-5.4606 -3.8804 -1.9699 -1.6666 -0.0764 -0.3971 -1.0303 -4.5483 ...
    -11.5280 -21.6417 -34.4458];

N = [0 1 2 3 4 5];    % Keeps polynomial orders.
%residuum = zeros(length(N), 1);
%condition_nb = zeros(length(N), 1);

for i=1:length(N)
    %figure
    [rA, rG, cn] = LLSA(X, Y, N(i));
    residuum(i) = rA;
    rG(i) = rG;
    condition_nb(i) = cn;
    
%     s_title = sprintf('Polynomial approximation for degree %d', N(i));
%     title(s_title);
%     xlabel('X');
%     ylabel('Y');
%     legend('experimental data', 'approximation');
%     % Moving legend to the more suitable position.
%     set(legend,'position',[0.3,0.2,0.09,0.09]);
%     hold on;
    
end
% % 
% X = [-5 -4 -3 -2 -1 0 1 2 3 4 5 6];
% Y = [-5.4606 -3.8804 -1.9699 -1.6666 -0.0764 -0.3971 -1.0303 -4.5483 ...
%     -11.5280 -21.6417 -34.4458 0];
% [rA, rG, cn] = LLSA(X, Y, 11);
% residuum(i+1) = rA;
% rG(i+1) = rG;
% condition_nb(i+1) = cn;

% N = [0 1 2 3 4 5 6 7 8 9 10 11];
disp('residuum A');
disp(residuum);
disp('rG');
disp(rG);

disp('cn');
disp(condition_nb);

figure
plot(N, residuum, 'o');
title('Euclidean norm of vector of residuum of A matrix.');
ylabel('error');
xlabel('Polynomial degree');

figure
plot(N, rG, 'o');
title('Euclidean norm of vector of residuum of Gram matrix.');
ylabel('error');
xlabel('Polynomial degree');

figure
plot(N,condition_nb);
title('Condition number of Gram matrix');
ylabel('error');
xlabel('Polynomial degree');


