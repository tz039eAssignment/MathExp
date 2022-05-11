x = [0 8.20 0.50 5.70 0.77 2.87 4.43 2.58 0.72 9.76 3.19 5.55];
y = [0 0.50 4.90 5.00 6.49 8.76 3.26 9.32 9.96 3.16 7.20 7.88];
r = [600 1000 800 1400 1200 700 600 800 1000 1200 1000 1100];

f = @(p) sum(r .* sqrt((x-p(1)).^2 + (y-p(2)).^2));

[x, fval] = fminunc(f, [3 1]);

x = 0:0.1:10;
y = 0:0.1:10;
[X, Y] = meshgrid(x, y);
Z = zeros(length(y), length(x));
for i = 1:length(x)
    for j = 1:length(y)
        Z(j, i) = -f([x(i), y(j)]);
    end
end

% colormap(viridis())
% mesh(X, Y, Z);
mesh(X, Y, Z, 'FaceColor', 'interp');
xlabel('x')
ylabel('y')
