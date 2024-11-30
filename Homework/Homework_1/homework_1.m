%% Homework 1
clear all;
clc;

%% Carica audio
[rock, fs_rock] = audioread('audio/crazy_train.wav');
[classic, fs_classic] = audioread('audio/the_wormhole.wav');

%% Informazioni di campionamento (brano classico)
disp('--- Informazioni di campionamento (brano classico) ---');
f_c = fs_classic
T_c = 1/f_c
T_0 = 1
df = 1/T_0
e = ceil(log2(T_0/T_c))
N = 2^e

%% DFT (brano classico)
x = classic(1:N);
X = zeros(N,1);
H = exp(-i*2*pi/N);

xp = x(1:2:N);
xd = x(2:2:N);
Xp = zeros(N, 1);
Xd = zeros(N, 1);

disp('Eseguendo la DFT sul brano classico...')
tic

for k = 1:N
    for n = 1:N/2
        Xp(k) = Xp(k) + xp(n) * (H^(2*(n-1)*(k-1)));
        Xd(k) = Xd(k) + (H^(k-1)) * xd(n) * (H^(2*(n-1)*(k-1)));
    end
    X(k) = X(k) + Xp(k) + Xd(k);
end

n = 0:N-1;
f = (n/N)*f_c;

figure(1)
subplot(2,1,1);
plot(f, abs(X));
xlabel('f');
ylabel('DFT[x(n)]');
title('The Wormhole')
hold on
toc

%% FFT (brano classico)
tic
y = abs(fft(classic, N));
n = 0:N-1;
f = (n/N)*f_c;

subplot(2,1,2);
plot(f, y);
xlabel('f');
ylabel('|X(f)|');

hold off
toc

pause; close

%% Informazioni di campionamento (brano rock)
disp('--- Informazioni di campionamento (brano rock) ---');
f_c = fs_rock
T_c = 1/f_c
T_0 = 1
df = 1/T_0
e = ceil(log2(T_0/T_c))
N = 2^e

%% DFT (brano rock)
x = rock(1:N);
X = zeros(N,1);
H = exp(-i*2*pi/N);

xp = x(1:2:N);
xd = x(2:2:N);
Xp = zeros(N, 1);
Xd = zeros(N, 1);

disp('Eseguendo la DFT sul brano rock...')

tic
for k = 1:N
    for n = 1:N/2
        Xp(k) = Xp(k) + xp(n) * (H^(2*(n-1)*(k-1)));
        Xd(k) = Xd(k) + (H^(k-1)) * xd(n) * (H^(2*(n-1)*(k-1)));
    end
    X(k) = X(k) + Xp(k) + Xd(k);
end

n = 0:N-1;
f = (n/N)*f_c;

figure(2)
subplot(2,1,1);
plot(f, abs(X));
xlabel('f');
ylabel('DFT[x(n)]');
title('Crazy Train')
hold on

toc
%% FFT (brano rock)
tic
y = abs(fft(rock, N));
n = 0:N-1;
f = (n/N)*f_c;

subplot(2,1,2);
plot(f, y);
xlabel('f');
ylabel('|X(f)|');

hold off
toc