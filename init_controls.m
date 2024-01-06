function init_controls
    global p_0 p_1 p_2 p_3 fig max_value p_0_x_slider p_0_y_slider p_1_x_slider p_1_y_slider p_2_x_slider p_2_y_slider p_3_x_slider p_3_y_slider

    slider_width = 240;
    slider_height = 24;

    left_offset = 512;
    bottom_offset = 428;
    
    gap_x = 12;
    gap_y = 36;

    p_0_x_slider = uicontrol('Parent', fig, 'Style', 'slider', 'Position', [left_offset, bottom_offset, slider_width, slider_height], 'value', p_0(1), 'min', -max_value, 'max', max_value);
    p_0_y_slider = uicontrol('Parent', fig, 'Style', 'slider', 'Position', [left_offset + slider_width + gap_x, bottom_offset, slider_width, slider_height], 'value', p_0(2), 'min', -max_value, 'max', max_value);
    uicontrol('Parent', fig, 'Style', 'text', 'Position', [left_offset, bottom_offset - gap_y, slider_width, slider_height], 'String', 'P0 x-coordinate');
    uicontrol('Parent', fig, 'Style', 'text', 'Position', [left_offset + slider_width + gap_x, bottom_offset - gap_y, slider_width, slider_height], 'String', 'P0 y-coordinate');

    p_1_x_slider = uicontrol('Parent', fig, 'Style', 'slider', 'Position', [left_offset, bottom_offset - gap_y * 2, slider_width, slider_height], 'value', p_1(1), 'min', -max_value, 'max', max_value);
    p_1_y_slider = uicontrol('Parent', fig, 'Style', 'slider', 'Position', [left_offset + slider_width + gap_x, bottom_offset - gap_y * 2, slider_width, slider_height], 'value', p_1(2), 'min', -max_value, 'max', max_value);
    uicontrol('Parent', fig, 'Style', 'text', 'Position', [left_offset, bottom_offset - gap_y * 3, slider_width, slider_height], 'String', 'P1 x-coordinate');
    uicontrol('Parent', fig, 'Style', 'text', 'Position', [left_offset + slider_width + gap_x, bottom_offset - gap_y * 3, slider_width, slider_height], 'String', 'P1 y-coordinate');

    p_2_x_slider = uicontrol('Parent', fig, 'Style', 'slider', 'Position', [left_offset, bottom_offset - gap_y * 4, slider_width, slider_height], 'value', p_2(1), 'min', -max_value, 'max', max_value);
    p_2_y_slider = uicontrol('Parent', fig, 'Style', 'slider', 'Position', [left_offset + slider_width + gap_x, bottom_offset - gap_y * 4, slider_width, slider_height], 'value', p_2(2), 'min', -max_value, 'max', max_value);
    uicontrol('Parent', fig, 'Style', 'text', 'Position', [left_offset, bottom_offset - gap_y * 5, slider_width, slider_height], 'String', 'P2 x-coordinate');
    uicontrol('Parent', fig, 'Style', 'text', 'Position', [left_offset + slider_width + gap_x, bottom_offset - gap_y * 5, slider_width, slider_height], 'String', 'P2 y-coordinate');

    p_3_x_slider = uicontrol('Parent', fig, 'Style', 'slider', 'Position', [left_offset, bottom_offset - gap_y * 6, slider_width, slider_height], 'value', p_3(1), 'min', -max_value, 'max', max_value);
    p_3_y_slider = uicontrol('Parent', fig, 'Style', 'slider', 'Position', [left_offset + slider_width + gap_x, bottom_offset - gap_y * 6, slider_width, slider_height], 'value', p_3(2), 'min', -max_value, 'max', max_value);
    uicontrol('Parent', fig, 'Style', 'text', 'Position', [left_offset, bottom_offset - gap_y * 7, slider_width, slider_height], 'String', 'P3 x-coordinate');
    uicontrol('Parent', fig, 'Style', 'text', 'Position', [left_offset + slider_width + gap_x, bottom_offset - gap_y * 7, slider_width, slider_height], 'String', 'P3 y-coordinate');

    addlistener(p_0_x_slider, 'Value', 'PostSet', @(src, event) update_plot);
    addlistener(p_0_y_slider, 'Value', 'PostSet', @(src, event) update_plot);
    
    addlistener(p_1_x_slider, 'Value', 'PostSet', @(src, event) update_plot);
    addlistener(p_1_y_slider, 'Value', 'PostSet', @(src, event) update_plot);
    
    addlistener(p_2_x_slider, 'Value', 'PostSet', @(src, event) update_plot);
    addlistener(p_2_y_slider, 'Value', 'PostSet', @(src, event) update_plot);

    addlistener(p_3_x_slider, 'Value', 'PostSet', @(src, event) update_plot);
    addlistener(p_3_y_slider, 'Value', 'PostSet', @(src, event) update_plot);

    update_plot;
end
