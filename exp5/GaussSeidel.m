function [x, iters] = GaussSeidel(A, x0, b, p_norm, tolerance, max_iters)
    x = x0;
    iters = 0;
    while true
        x_old = x;
        for i = 1:length(x)
            x(i) = ( b(i) - A(i, 1:i-1)*x(1:i-1) - A(i, i+1:end)*x(i+1:end) ) / A(i, i);
        end
        iters = iters + 1;
        if norm(x - x_old, p_norm) < tolerance || iters >= max_iters
            break
        end
    end
end