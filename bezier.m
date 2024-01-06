function bezier
    global t b_0 b_1 b_2 b_3
    figure('Name','Bezier Basic Functions');
    hold on;
    plot(t, b_0);
    plot(t, b_1);
    plot(t, b_2);
    plot(t, b_3);
    hold off;
end