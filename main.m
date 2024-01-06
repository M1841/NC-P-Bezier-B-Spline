close all;
clear;
clc;

global p_0 p_1 p_2 p_3 t b_0 b_1 b_2 b_3 fig fig_axes max_value

max_value = 5;

t = 0: 0.001: 1;

b_0 = (1 - t).^3;
b_1 = 3 * t .* (1 - t).^2;
b_2 = 3 * t.^2 .* (1 - t);
b_3 = t.^3;

bezier;

p_0 = [-max_value, -max_value / 2];
p_1 = [-max_value * 2 / 3, max_value / 2];
p_2 = [max_value * 2 / 3, max_value / 2];
p_3 = [max_value, -max_value / 2];

fig = figure('Name', 'Cubic Bezier Curve', 'Position', [240, 120, 1050, 600]);

fig_axes = axes('Parent', fig, 'Position', [0.05 0.2 0.4 0.7]);
xlim(fig_axes, [-max_value, max_value]);
ylim(fig_axes, [-max_value, max_value]);
hold(fig_axes, 'on');

init_controls;
