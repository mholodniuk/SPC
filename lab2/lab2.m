clear all; clc; close all;

% K(s) = k/(Ts + 1)
k = 1;
T = 2;

sys = tf(k, [T, 1]);
omega_w = 1:10;

omega_1 = 0.2 -0.4i;

figure(1); 
hold on; grid on;
set(gcf,'color','w');
set(0, 'DefaultLineLineWidth', 2);
plot(omega_1, 'o');
nyquist(sys);
nyquist(sys, omega_w, 'x');


figure(2);
set(gcf,'color','w');
set(0, 'DefaultLineLineWidth', 2);
for i = 1:length(omega_w)
    omega = omega_w(i);
    sim('zad12.slx', 10);
    subplot(length(omega_w), 1, i);
    title("omega: " + omega);
    hold on; grid on;
    plot(ans.u, 'color', 'r');
    plot(ans.y, 'color', 'b');
end

