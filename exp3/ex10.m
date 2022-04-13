clearvars
clf

x = [0 3 5 7 9 11 12 13 14 15];
y1 = [0 1.8 2.2 2.7 3 3.1 2.9 2.5 2 1.6];
y2 = [0 1.2 1.7 2 2.1 2 1.8 1.2 1 1.6];

interpolation_x = 0:0.1:15;
interpolation_y1 = spline(x, y1, interpolation_x);
interpolation_y2 = spline(x, y2, interpolation_x);

t = table(interpolation_x', interpolation_y1', interpolation_y2');
writetable(t, 'ex10_result.xlsx')

hold on
plot(x, y1, '.')
plot(x, y2, '.')
plot(interpolation_x, interpolation_y1)
plot(interpolation_x, interpolation_y2)
hold off

set(gcf, 'Units', 'centimeters', 'Position', [0, 0, 18, 9]);
saveas(gcf, 'ex10_result', 'epsc')