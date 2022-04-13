clearvars
clf

x = [7 10.5 13 17.5 34 40.5 44.5 48 56 61 68.5 76.5 80.5 91 96 101 104 106.5 111.5 118 123.5 136.5 142 146 150 157 158];
y1 = [44 45 47 50 50 38 30 30 34 36 34 41 45 46 43 37 33 28 32 65 55 54 52 50 66 66 68];
y2 = [44 59 70 72 93 100 110 110 110 117 118 116 118 118 121 124 121 121 121 122 116 83 81 82 86 85 68];

(40/18)^2 * (trapz(x, y2) - trapz(x, y1))

(40/18)^2 * (integral(@(t)spline(x, y2, t), 7, 158) - integral(@(t)spline(x, y1, t), 7, 158))

hold on
fplot(@(t)spline(x, y2, t), [7 158])
fplot(@(t)spline(x, y1, t), [7 158])
plot(x, y1, '.--')
plot(x, y2, '.--')
hold off

saveas(gcf, 'ex11_spline', 'epsc')
