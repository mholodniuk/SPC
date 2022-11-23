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


A = [4, -3, 2, 0, -1];
B = [5, 14, 4, 1, 0];

Legend = ["$a = 4, \quad b = 5$", "$a = -3, \quad b = 14$", ...
    "$a = 2, \quad b = 4$", "$a = 0, \quad b = 1$", "$a = -1, \quad b = 0$"];
Title = ["$z_{1} = -2+i, \quad z_{2} = -2-i$", "$z_{1} = 1.5+\frac{\sqrt{47}}{2}i, \quad z_{2} = 1.5-\frac{\sqrt{47}}{2}i$", ...
    "$z_{1} = -1+1.75i, \quad z_{2} = -1-1.75i$", "$z_{1} = i, \quad z_{2} = -i$",  "$z_{1} = 0, \quad z_{2} = 1$"];

for i = 1:length(B)
    a = A(i);
    b = B(i);
    sim('zad2.slx', 20);
    
    subplot(5, 1, i);
    plot(ans.skok);
    hold on; grid on;
    xlabel('');
    ylabel('');
    legend(Legend(i), 'Location', 'east', 'Interpreter', 'latex');
    title(Title(i), 'Interpreter', 'latex', 'FontSize', 14);
end
