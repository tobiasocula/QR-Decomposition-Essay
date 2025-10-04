function x = backSub(R, b)
    n = size(R, 1);
    x = zeros(n, 1);
    for i = n:-1:1
        if i ~= n
            x(i) = (b(i) - R(i, i+1:end) * x(i+1:end)) / R(i, i);
        else
            x(i) = b(i) / R(i, i);
        end
    end
end
