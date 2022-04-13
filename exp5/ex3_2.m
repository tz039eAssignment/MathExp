n = 20;
A_base = sparse(1:(n-1), 2:n, -1/2, n, n) + sparse(1:(n-1), 2:n, -1/2, n, n)' +...
        sparse(1:(n-2), 3:n, -1/4, n, n) + sparse(1:(n-2), 3:n, -1/4, n, n)';
diag_value = 3;

rng('default');
rng(2019011288);
b = rand(n, 1);
b'
x0 = zeros(n, 1);

iters_arr = [];

for i = 1 : 25
    A = A_base + sparse(1:n, 1:n, diag_value, n, n);
    diag_value = diag_value * 2;
    [x, iters] = Jacobi(A, x0, b, Inf, 1e-5, 1000);
    iters_arr = [iters_arr, iters];
end

plot(1:length(iters_arr), iters_arr, '-o')
xlabel('轮数')
ylabel('迭代次数')
saveas(gcf, 'ex3_2_iter_vs_round', 'epsc')