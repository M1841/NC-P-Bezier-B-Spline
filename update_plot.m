function update_plot
    global p_0 p_1 p_2 p_3 b_0 b_1 b_2 b_3 fig_axes p_0_x_slider p_0_y_slider p_1_x_slider p_1_y_slider p_2_x_slider p_2_y_slider p_3_x_slider p_3_y_slider

    p_0 = [get(p_0_x_slider, 'Value'), get(p_0_y_slider, 'Value')];
    p_1 = [get(p_1_x_slider, 'Value'), get(p_1_y_slider, 'Value')];
    p_2 = [get(p_2_x_slider, 'Value'), get(p_2_y_slider, 'Value')];
    p_3 = [get(p_3_x_slider, 'Value'), get(p_3_y_slider, 'Value')];

    x = p_0(1) * b_0 + p_1(1) * b_1 + p_2(1) * b_2 + p_3(1) * b_3;
    y = p_0(2) * b_0 + p_1(2) * b_1 + p_2(2) * b_2 + p_3(2) * b_3;
    
    cla(fig_axes);
    plot([p_0(1) p_1(1) p_2(1) p_3(1)], [p_0(2) p_1(2) p_2(2) p_3(2)], 'Color', [0.75 0.75 0.75], 'LineStyle', '--');
    plot(fig_axes, x, y, 'Color', [0 0 0], 'LineWidth', 1);

    text(p_0(1), p_0(2), 'P0');
    text(p_1(1), p_1(2), 'P1');
    text(p_2(1), p_2(2), 'P2');
    text(p_3(1), p_3(2), 'P3');
end
