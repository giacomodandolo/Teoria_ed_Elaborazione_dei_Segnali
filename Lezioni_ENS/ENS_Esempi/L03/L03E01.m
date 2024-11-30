%% Lezione 03 - Esempio 01
clear all;
clc;

%% x(n)
x = ones(1,5);

figure
set(gca,'FontSize',14)
stem(x,'k')
xlabel('n')
title('x(n)')
axis([0 8 -0.5 3.5])
grid on

%% y(n)
y = ones(1,3);

figure
set(gca,'FontSize',14)
stem(y,'k')
xlabel('n')
title('y(n)')
axis([0 8 -0.5 3.5])
grid on

%% z(n) = x(n) * y(n)
z = conv(x,y);

figure
set(gca,'FontSize',14)
stem(z,'k')
xlabel('n')
title('z(n)')
axis([0 8 -0.5 3.5])
grid on

pause;
close
close
close
