clearvars

x = [0 3 5 7 9 11 12 13 14 15];
y1 = [0 1.8 2.2 2.7 3 3.1 2.9 2.5 2 1.6];
y2 = [0 1.2 1.7 2 2.1 2 1.8 1.2 1 1.6];

integral(@(t)spline(x, y1, t), 0, 15) - integral(@(t)spline(x, y2, t), 0, 15)
quad(@(t)spline(x, y1, t), 0, 15) - quad(@(t)spline(x, y2, t), 0, 15)
quadl(@(t)spline(x, y1, t), 0, 15) - quadl(@(t)spline(x, y2, t), 0, 15)