function init_controls
    global n p fig max_value p_sliders p_generation_method;

    slider_width = 240;
    slider_height = 24;

    left_edge = 512;
    top_edge = 512;
    
    gap_x = 12;
    gap_y = 36;

    p = zeros(n, 2);
    p_sliders = zeros(n, 2);

    for i = 1: n
        switch p_generation_method
            case "linear"
                tmp = (i-1) / (n - 1) * 2 * max_value - max_value;
                p(i, :) = [tmp, tmp];
            otherwise
                p(i, :) = [random_point(max_value), random_point(max_value)];
        end

        for j = 1: 2
            left_offset = left_edge + (j - 1) * (slider_width + gap_x);
            bottom_offset = top_edge - (i - 1) * (slider_height + gap_y); 

            p_sliders(i, j) = uicontrol('Parent', fig, 'Style', 'slider', 'Value', p(i, j), 'Min', -max_value, 'Max', max_value, 'Position', [left_offset, bottom_offset, slider_width, slider_height]);

            uicontrol('Parent', fig, 'Style', 'text', 'String', sprintf('P%d %c-coordinate: %.2f', i - 1, 'x' + j - 1), 'Position', [left_offset, bottom_offset - slider_height, slider_width, slider_height]);
            
            addlistener(p_sliders(i, j), 'ContinuousValueChange', @(src, event) update_plot);
        end
    end

    update_plot;
end
