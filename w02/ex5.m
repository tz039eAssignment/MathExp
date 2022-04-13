clearvars

% raw data
t = [1790 1800 1810 1820 1830 1840 1850 1860 1870 1880 1890 1900 1910 1920 1930 1940 1950 1960 1970 1980 1990 2000];
x = [3.9 5.3 7.2 9.6 12.9 17.1 23.2 31.4 38.6 50.2 62.9 76.0 92.0 106.5 123.2 131.7 150.7 179.3 204.0 226.5 251.4 281.4];

% plot the points
hold on
plot(1:length(t), x, '.', 'DisplayName', 'Data points')

% the last one for test only
last_x = x(end)
x = x(1: end-1);

% the model to be fitted
model = @(c, k, x_m, x) (c * exp(-k * x) + x_m);

% only fit the last `LAST_N` points, without `last_x`
LAST_N_ARRAY = [3 5 6 7 9 21];
for i = 1 : length(LAST_N_ARRAY)
    LAST_N = LAST_N_ARRAY(i);

    % prepare data
    t = length(x)-LAST_N+1 : length(x);
    temp_x = x(length(x)-LAST_N+1 : length(x));
    % fitting
    f = fit(t(:), temp_x(:), model, fitoptions( ...
        Method='NonlinearLeastSquares',...
        StartPoint=[-1, 1, 300],...
        Lower=[-Inf, 0, 0], Upper=[0, +Inf, +Inf]...
    ));
    fitted_model = @(t) model(f.c, f.k, f.x_m, t);
    % calculate error
    fitted_last_x = fitted_model(length(x) + 1)
    last_x_relative_error = abs(fitted_last_x - last_x) / last_x;
    % legend text
    fitted_model_text = sprintf('\\quad x(t) = %.6f e^{-%.6f t} + %.6f', f.c, f.k, f.x_m)
    last_n_text = sprintf('\\mathrm{LAST\\_N} = %d', LAST_N);
    error_text = sprintf('e_r = %f\\%%', last_x_relative_error*100)
    legend_text = [sprintf('$%s \\quad %s$', last_n_text, error_text) , newline, sprintf('$%s$', fitted_model_text)];
    % plot
    fplot(fitted_model, [length(x)-LAST_N+1 length(x)+1], 'DisplayName', legend_text) % length(x)+1 is to cover `last_x`
end

hold off
legend('Interpreter','latex','Location','northwest')

set(gcf, 'PaperSize', [10 8])
print(gcf, 'fitting_1.pdf', '-dpdf', '-fillpage')