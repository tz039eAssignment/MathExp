d = 100;
v1 = 1;
v2 = 2;
k = v1/v2;

% 数值
M = @(~, Y) [
    v1 - v2*Y(1)/sqrt((d-Y(2))*(d-Y(2)) + Y(1)*Y(1))
    v2*(d-Y(2))/sqrt((d-Y(2))*(d-Y(2)) + Y(1)*Y(1))
];

% 解析解
AM = @(y) (d - y)./2.*( (d./(d-y)).^k - (d./(d-y)).^(-k) );

[t, XY] = ode45(M, 0:0.1:70, [0 0]);

% 保存数据
datas = table(t, XY(:, 1), XY(:, 2), 'VariableNames', {'time', 'x', 'y'});
writetable(datas, 'ex6_xy.xlsx')

% x, y ~ t
subplot(1, 2, 1)
plot(t, XY(:, 1))
hold on
plot(t, XY(:, 2))
hold off
legend({'$x$', '$y$'}, "Interpreter", "latex", "Location", "northwest")
title('$x, y \sim t$', "Interpreter", "latex")

% x ~ y
subplot(1, 2, 2)
plot(XY(:, 1), XY(:, 2))
hold on
plot(AM(XY(:, 2)), XY(:, 2))
title('$x \sim y$', "Interpreter", "latex")

set(gcf, 'Units', 'centimeters', 'Position', [0, 0, 26, 9]);
saveas(gcf, sprintf('ex6_xy_v1_%.1f.eps', v1), 'epsc');

