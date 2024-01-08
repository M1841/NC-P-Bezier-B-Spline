function update_plot
    global p b fig_axes p_sliders;

    n = length(p);

    x = 0;
    y = 0;

    for i = 1: n
        for j = 1: 2
            p(i, j) = get(p_sliders(i, j), 'Value');
        end

        x = x + p(i, 1) * b(i, :);
        y = y + p(i, 2) * b(i, :);
    end
    
    cla(fig_axes);
    plot(p(:, 1), p(:, 2), 'Color', [0.75 0.75 0.75], 'LineStyle', '--');
    plot(fig_axes, x, y, 'Color', [0 0 0], 'LineWidth', 1);
    
    for i = 1: n
        text(p(i, 1), p(i, 2), sprintf("P%d", i - 1));
    end
end
