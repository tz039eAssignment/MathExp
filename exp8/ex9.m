p = [0.45 0.55 0.7 0.5];
n = [2000 4000 5000 3000];
q = [0.89 1.1 1.8];

P = [1 3 0.2
     1 4 -0.4
     1 2 0.25
     2 3 0.35
     2 1 -0.4
     3 3 -0.3
     3 3 0.5
     3 1 -0.3];

A = zeros(12, 12);
% content percentage constraint
for k = 1:8
    i = P(k, 1); j = P(k, 2);
    perc = P(k, 3);
    if perc > 0
        A(k, (i-1)*4+j) = 1;
    else
        A(k, (i-1)*4+j) = -1;
    end
    for j = 1:4
        A(k, (i-1)*4+j) = A(k, (i-1)*4+j) - perc;
    end
end
b = zeros(1, 12);
% max supply constraint
for j = 1:4
    for i = 1:3
        A(8+j, (i-1)*4+j) = 1;
    end
    b(8+j) = n(j);
end

f = zeros(1, 12);
for i = 1:3
    for j = 1:4
        f((i-1)*4+j) = q(i)-p(j);
    end
end

[x, fval] = linprog(-f, A, b, [], [], zeros(12, 1), [])
