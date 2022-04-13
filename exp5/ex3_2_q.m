n = 20;
LU = sparse(1:(n-1), 2:n, -1/2, n, n) + sparse(1:(n-1), 2:n, -1/2, n, n)' +...
        sparse(1:(n-2), 3:n, -1/4, n, n) + sparse(1:(n-2), 3:n, -1/4, n, n)';
diag_value = 3;

q_arr = [];

for i = 1 : 25
    D = sparse(1:n, 1:n, diag_value, n, n);
    diag_value = diag_value * 2;
    q = normest(D \ LU);
    q_arr = [q_arr, q];
end

plot(1:length(q_arr), q_arr, '-o')
xlabel('轮数')
ylabel('q')
saveas(gcf, 'ex3_2_q_vs_round', 'epsc')