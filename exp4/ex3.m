% indexing the return value of a function in the same line
indexing = @(x, varargin) x(varargin{:});

% 0-60s
syms h(t)
[V] = odeToVectorField((1400-18*t)*diff(h, 2) == 32000 - 9.8*(1400-18*t) - 0.4*(1-h/15000)*diff(h)^2);
M = matlabFunction(V, 'vars', {'t','Y'});
[t_first, Y] = ode45(M, 0:0.01:60, [0 0]);
h_first = Y(:, 1);
v_first = Y(:, 2);
a_first = zeros(1, length(t_first));
for i = 1 : length(t_first)
    a_first(i) = indexing(M(t_first(i), Y(i, :)), 2);
end

% run out of fuel
runout_h = h_first(end)
runout_v = v_first(end)
runout_a = a_first(end)

% 60-
[V] = odeToVectorField(320*diff(h, 2) == - 9.8*320 -0.4*(1-h/15000)*diff(h)*abs(diff(h)));
M = matlabFunction(V, 'vars', {'t','Y'});
right_border = 100;
[t_second, Y] = ode45(M, 60:0.01:right_border, [runout_h runout_v]);
h_second = Y(:, 1);
v_second = Y(:, 2);
a_second = zeros(1, length(t_second));
for i = 1 : length(t_second)
    a_second(i) = indexing(M(t_second(i), Y(i, :)), 2);
end

subplot(1, 3, 1); plot([t_first; t_second], [h_first; h_second]); title('高度');
subplot(1, 3, 2); plot([t_first; t_second], [v_first; v_second]); title('速度');
subplot(1, 3, 3); plot([t_first; t_second], [a_first, a_second]); title('加速度');

% when speed is 0
[v, i] = min(abs(v_second));
h_second(i)
v
a_second(i)

set(gcf, 'Units', 'centimeters', 'Position', [0, 0, 32, 9]);
saveas(gcf, 'ex3', 'epsc');

