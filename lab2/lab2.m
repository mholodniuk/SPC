clear all; clc; close all;

% K(s) = k/(Ts + 1)
k = 1;
T = 2;

sys = tf(k, [T, 1]);
omega_w = 1:2:10;

omega_points = [];

for idx = 1:length(omega_w)
    omega_points(idx) = k/(T*i*omega_w(idx) + 1);
end

omega_points


figure(1);
hold on; grid on;
set(gcf,'color','w');
set(0, 'DefaultLineLineWidth', 2);
nyquist(sys);
nyquist(sys, 'r*', omega_w);

Title = ["$k = 2, \quad \omega = 1$", "$k = 2, \quad \omega = 3$", ...
    "$k = 2, \quad \omega = 5$", "$k = 2, \quad \omega = 7$",  "$k = 2, \quad \omega = 9$"];

figure(2);
set(gcf,'color','w');
set(0, 'DefaultLineLineWidth', 2);
for i = 1:length(omega_w)
    omega = omega_w(i);
    sim('zad12.slx', 10);
    subplot(length(omega_w), 1, i);
    title(Title(i), 'Interpreter', 'latex', 'FontSize', 14);
    hold on; grid on;
    plot(ans.u, 'color', 'r'); % wejście
    plot(ans.y, 'color', 'b'); % wyjście
end

