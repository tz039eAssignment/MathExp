x_0 = 100;
y_0 = 1;

r = 1.1;
N = 1000;
a = 0.001;
b = 0.0028508;

n = 160;

save = 1;

x = zeros(1, n+1);
y = zeros(1, n+1);
x(1) = x_0;
y(1) = y_0;

for i = 1 : n
    x(i+1) = (r * (1 - x(i) / N) + 1 - a * y(i)) * x(i);
    y(i+1) = b * x(i) * y(i);
end

subplot(2, 1, 1);
plot(0:n, x, '.-');
title('host')

subplot(2, 1, 2);
plot(0:n, y, '.-');
title('parasite')

sgtitle({
    sprintf('$x_0=%.3f,\\ y_0=%.3f,\\ r=%.3f$', x_0, y_0, r), ...
    sprintf('$a=%.3f,\\ b=%.7f,\\ N=%.3f$', a, b, N)
}, 'Interpreter', 'latex')

if save == 1
    saveas(gcf, sprintf('ex9-x0_%.3f-y0_%.3f-r_%.3f-a_%.3f-b_%.7f-N_%.3f.eps', x_0, y_0, r, a, b, N), 'epsc')
end

