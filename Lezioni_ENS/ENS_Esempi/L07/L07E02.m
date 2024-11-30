%% Lezione 07 - Esempio 02
clear all;
clc;

%% DFT dei segnali a durata e banda infinite
disp('--- DFT dei segnali a durata e banda infinite ---')
fc=40.52;
N=128;
Tc=1/fc;
T0=N*Tc;
Df=1/T0;
n=[0:N-1];
x_samp=exp(-2*n*Tc);
f=[-N/2:N/2-1]*Df;
DFT=fftshift(fft(x_samp,N));

figure
set (gca,'FontSize',14)
stem(f,abs(DFT)*Tc)
xlabel('f\cdot f_c')
ylabel('|X(f)|')
axis([-20 20 0 0.6])
grid on
hold on
f=[-N/2:0.01:N/2-1]*Df;
X=abs(1./(2+j*2*pi*f));
plot(f,X,'r--')

pause;
close