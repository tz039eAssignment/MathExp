n = 5;
b = [0 0 5 3 0];
s = [0.4 0.6 0.6 0.4];
A = sparse(1, 1:n, b, n, n) + sparse(2:n, 1:(n-1), s, n, n);

h = [0 500 500 500 500]';

x = (A - eye(n)) \ h