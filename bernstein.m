function b = bernstein(n, t)
    b = zeros(n, length(t));

    figure('Name','Bernstein Basis Polynomials');
    hold on;

    for i = 0: n
        C = factorial(n) / (factorial(i) * factorial(n - i));
        b(i + 1, :) = C * (1 - t).^(n - i) .* t.^i;

        plot(t, b(i + 1, :));
    end

    hold off;
end
