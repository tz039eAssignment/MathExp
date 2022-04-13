function L = lagr(x_arr, y_arr, x)
    n = length(x_arr);

    L = 0.;
    for i = 1 : n
        l = 1.;
        for j = 1 : n
            if j ~= i
                l = l * (x - x_arr(j)) / (x_arr(i) - x_arr(j));
            end
        end
        L = L + l * y_arr(i);
    end

end