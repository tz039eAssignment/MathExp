r1 = 1;
r2 = 1;
n1 = 100;
n2 = 100;
s1 = 1.5;
s2 = 1.5;
x0 = 10;
y0 = 10;

rightmost = 80;

M = @(~, Y) [
    r1 * Y(1) * (1 - Y(1) / n1 - s1 * Y(2) / n2)
    r2 * Y(2) * (1 - Y(2) / n2 - s2 * Y(1) / n1)
];

[t, XY] = ode45(M, 0:0.01:rightmost, [x0 y0]);

% x, y ~ t
subplot(1, 2, 1)
plot(t, XY(:, 1))
hold on
plot(t, XY(:, 2))
hold off
legend({'$x$', '$y$'}, "Interpreter", "latex", "Location", "northwest")
title('$x, y \sim t$', "Interpreter", "latex")
xlabel('$t$', "Interpreter", "latex")
ylabel('$x,\ y$', "Interpreter", "latex")

% x ~ y
subplot(1, 2, 2)
plot(XY(:, 1), XY(:, 2))
title('$x \sim y$', "Interpreter", "latex")
xlabel('$y$', "Interpreter", "latex")
ylabel('$x$', "Interpreter", "latex")

set(gcf, 'Units', 'centimeters', 'Position', [0, 0, 26, 9]);
saveas(gcf, 'ex9.eps', 'epsc');