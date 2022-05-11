credit = [2, 2, 1, 1, 5];
due = [9, 15, 4, 3, 2];
interest = [0.043, 0.027, 0.024, 0.022, 0.045];

A = [0 -1 -1 -1 0; credit - 1.4; due - 5; ones(1, 5)];
b = [-400; 0; 0; 1000];
[x, fval] = linprog(-interest, A, b, [], [], zeros(1, 5), [])