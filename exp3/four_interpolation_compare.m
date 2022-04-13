clearvars
clf

func = @(x) exp(-x.^2);

n = 11;
m = 70;

point_x_arr = linspace(-2, 2, n);
point_y_arr = func(point_x_arr);

interpolate_value_arr = linspace(-2, 2, m);
accurate_y_arr = func(interpolate_value_arr);

% lagr
subplot(3, 1, 1);
title('lagr')
hold on
fplot(func, [-2 2])
lagr_func = @(x)lagr(point_x_arr, point_y_arr, x);
lagr_y_arr = arrayfun(lagr_func, interpolate_value_arr);
lagr_error_rates = abs(accurate_y_arr - lagr_y_arr) ./ accurate_y_arr;
plot(interpolate_value_arr, lagr_y_arr, '.')
hold off

% linear
subplot(3, 1, 2);
title('linear')
hold on
fplot(func, [-2 2])
linear_y_arr = interp1(point_x_arr, point_y_arr, interpolate_value_arr);
linear_error_rates = abs(accurate_y_arr - linear_y_arr) ./ accurate_y_arr;
plot(interpolate_value_arr, linear_y_arr, '.')
hold off

% spline
subplot(3, 1, 3);
title('spline')
hold on
fplot(func, [-2 2])
spline_y_arr = spline(point_x_arr, point_y_arr, interpolate_value_arr);
spline_error_rates = abs(accurate_y_arr - spline_y_arr) ./ accurate_y_arr;
plot(interpolate_value_arr, spline_y_arr, '.')
hold off

t = table(interpolate_value_arr', accurate_y_arr', ...
    lagr_y_arr', lagr_error_rates' .* 100, ...
    linear_y_arr', linear_error_rates' .* 100, ...
    spline_y_arr', spline_error_rates' .* 100);
writetable(t, sprintf('4_interpolation_compare_n_%d.xlsx', n))

% title
sgtitle(sprintf('n = %d  m = %d', n, m))

saveas(gcf, sprintf('4_interpolation_compare_n_%d', n), 'epsc')