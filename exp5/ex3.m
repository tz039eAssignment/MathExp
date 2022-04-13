n = 20;
A = sparse(1:n, 1:n, 3, n, n) + ...
    sparse(1:(n-1), 2:n, -1/2, n, n) + sparse(1:(n-1), 2:n, -1/2, n, n)' +...
    sparse(1:(n-2), 3:n, -1/4, n, n) + sparse(1:(n-2), 3:n, -1/4, n, n)';

rng('default');
rng(2019011288);

t = cell2table(cell(0,9), 'VariableNames', {'b', 'x0', 'x_ja', 'iters_ja', 'x_gs', 'iters_gs', 'x_true', 'error_ja', 'error_gs'});

for i = 1 : 20
    b = rand(n, 1);
    x0 = rand(n, 1);

    [x_ja, iters_ja] = Jacobi(A, x0, b, 1e-6, 1000);
    [x_gs, iters_gs] = GaussSeidel(A, x0, b, 1e-6, 1000);

    x_true = A\b;

    t = [t; {b, x0, x_ja, iters_ja, x_gs, iters_gs, x_true, norm(x_ja - x_true), norm(x_gs - x_true)}];

end

writetable(t, 'results.csv');