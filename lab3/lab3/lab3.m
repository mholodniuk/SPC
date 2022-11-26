clear all; close all; clc;

time = 20;

M = 0.5;
m = 0.2;
L = 0.3;
b = 0.1;
g = 9.8;

A = [ 0     1         0         0;
      0   -b/M     -m*g/M       0;
      0     0         0         1;
      0 -b/(M*L) -(m+M)*g/(M*L) 0 ];
B = [0; 1/M; 0; 1/(M*L)];
C = diag([1 1 1 1]);
D = zeros(4, 1);

Q = diag([1 10 1 100]);
R = 10;
K = lqr(A, B, Q, R);

% x, x_dot, theta, theta_dot
x0 = [0; 0; 0; 0]; % warunek początkowy
y0 = [2; 0; 0; 0]; % wyjście

out = sim("symulacja.slx", time);

figure();
set(gcf,'color','w');
set(0, 'DefaultLineLineWidth', 2);
subplot(2, 1, 1);
hold on; grid on;
plot(out.output.Time, out.output.Data(:, 1));
plot(out.output.Time, out.output.Data(:, 2));
plot(out.output.Time, out.output.Data(:, 3));
plot(out.output.Time, out.output.Data(:, 4));
legend("$x$", "$\dot{x}$", "$\theta$", "$\dot{\theta}$", 'Interpreter', 'latex', 'FontSize', 20)

hold on;
subplot(2, 1, 2);
plot(out.input.Time, out.input.Data);
grid on;
