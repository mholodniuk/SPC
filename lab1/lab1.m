clear all; clc; close all;

sim('zad1.slx');

figure(1); 
set(gcf,'color','w');
set(0, 'DefaultLineLineWidth', 2);

subplot(3, 2, 1);
plot(ans.calkujacy, 'LineWidth', 2);
hold on; grid on;
title('Człon całkujący - odpowiedź skokowa');

subplot(3, 2, 2);
plot(ans.calkujacy_imp, 'LineWidth', 2);
hold on; grid on;
title('Człon całkujący - odpowiedź impulsowa');

subplot(3, 2, 3);
plot(ans.rozniczkujacy, 'LineWidth', 2);
hold on; grid on;
title('Człon różniczkujący - odpowiedź skokowa');

subplot(3, 2, 5);
plot(ans.proporcjonalny, 'LineWidth', 2);
hold on; grid on;
title('Człon proporcjonalny - odpowiedź skokowa');

subplot(3, 2, 6);
plot(ans.proporcjonalny_imp, 'LineWidth', 2);
hold on; grid on;
title('Człon proporcjonalny - odpowiedź impulsowa');


figure(2);
set(gcf,'color','w');
set(0, 'DefaultLineLineWidth', 2);


A = [4, 4, 2, 0, -1];
B = [5, -5, 4, 1, 0];

for i = 1:length(B)
    a = A(i);
    b = B(i);
    sim('zad2.slx', 100);
    
    subplot(5, 1, i);
    plot(ans.skok);
    hold on; grid on;
end
