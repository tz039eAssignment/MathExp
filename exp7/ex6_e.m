t = 10 * (0:32);
y = [0.844 0.908 0.932 0.936 0.925 0.908 0.881 0.85 0.818 0.784 0.751 0.718 0.685 0.658 0.628 0.603 0.58 0.558 0.538 0.522 0.506 0.49 0.478 0.467 0.457 0.448 0.438 0.431 0.424 0.42 0.414 0.411 0.406];

f = @(x, t) (x(1) + x(2) * exp(-x(4) * t) + x(3) * exp(-x(5) * t));

x0 = [0.5 1.5 -1 0.01 0.02];
rng(2019011288);
e = 0.1 * rand(1, 33) - 0.05;
options = optimoptions('lsqcurvefit','Algorithm','levenberg-marquardt');
[x,resnorm,residual,exitflag,output] = lsqcurvefit(f, x0, t, y+e, [], [], options);

disp('x'); disp(x);
fprintf('iters: %d\n', output.iterations);

hold on
plot(t, y, '.')
fplot(@(t) f(x, t), [0 320])
saveas(gcf, 'ex6_e.eps', 'epsc')
