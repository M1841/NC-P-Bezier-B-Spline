close all;
clear;
clc;

global n b fig fig_axes max_value p_generation_method;

n = input("Choose a degree for the Bezier functions (1 <= n <= 170): ");
if n > 0 && n < 171
    p_generation_method = sprintf("%s", input("Choose the generation method for the initial points (linear or random): ", "s"));
    
    max_value = 5;
    
    t = 0: 0.001: 1;
    
    b = bernstein(n, t);
    
    n = n + 1;
    
    fig = figure('Name', 'Cubic Bezier Curve', 'Position', [240, 120, 1050, 600]);
    
    fig_axes = axes('Parent', fig, 'Position', [0.05 0.2 0.4 0.7]);
    xlim(fig_axes, [-max_value, max_value]);
    ylim(fig_axes, [-max_value, max_value]);
    hold(fig_axes, 'on');
    
    init_controls;
else
    fprintf("n out of range\n");
end
