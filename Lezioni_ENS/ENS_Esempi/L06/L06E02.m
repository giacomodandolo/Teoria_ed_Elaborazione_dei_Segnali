%% Lezione 06 - Esempio 02
clear;
clc;

%% Campionata su un numero appropriato N di campioni e confrontata con DTFT
disp('--- Campionata su un numero appropriato N di campioni e confrontata con DTFT ---')
a=0.8;
N=10;
n=[0:N-1];
x=a.^n;
y=fft(x,length(x));
figure
set (gca,'FontSize',14)
stem(n,x)
xlabel('n')
ylabel('x(n)')
axis([0 N-1 -0.5 1.5])
grid on

figure
set (gca,'FontSize',14)
stem(n,abs(y))
xlabel('k')
ylabel('|X(k)|')
axis([0 N-1 -1 5]);
grid on
f=linspace(0,1,1000);
X=1./(1-a*exp(-j*2*pi*f));
hold on
plot(f*N,abs(X),'r--')
hold off

pause;
close; close