clear all; clc; close all;

% K(s) = k/(Ts + 1)
k = 1;
T = 1;

sys = tf(k, [T, 1]);
omega_w = 1:2:10;


% Nyquist z Control Toolbox
figure(1); 
hold on; grid on;
set(gcf,'color','w');
set(0, 'DefaultLineLineWidth', 2);
nyquist(sys);
nyquist(sys, omega_w, 'o');


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

