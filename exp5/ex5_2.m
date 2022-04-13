X = [15 20 30; 30 10 45; 20 60 0];
x = [100 200 150];


A = X;
for j = 1 : length(A)
    A(:, j) = A(:, j) / x(j);
end

for i = 1 : 3
    d = zeros(3, 1);
    d(i) = 1;
    x = (eye(3) - A) \ d;
    x
end