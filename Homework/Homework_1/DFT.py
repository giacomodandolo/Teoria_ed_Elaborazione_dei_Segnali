import cmath
import math
from scipy.io import wavfile


def H(n, k, N):
    return cmath.exp(-complex(2 * math.pi * n * (k / N)))


def DFT_rp(x, l, r, k):
    N = r - l
    val = 0

    if N == 0:
        return x[2 * int(l)] * H(l, k, 1)

    m = int((l + r) / 2)

    val = (DFT_rp(x, l, m, k) + DFT_rp(x, m + 1, r, k)) * H(l, k, N)

    return val


def DFT_rd(x, l, r, k):
    N = r - l
    val = 0

    if N == 0:
        return x[2 * int(l) + 1] * H(l, k, 1)

    m = int((l + r) / 2)

    val = H(l, k, 2 * N) * (DFT_rd(x, l, m, k) + DFT_rd(x, m + 1, r, k)) * H(
        l, k, N)

    return val


def DFT(x, N):
    X = []

    for k in range(0, N):
        Xk = DFT_rp(x, 0, int(N / 2 - 1), k) + DFT_rd(x, 0, int(N / 2 - 1), k)
        X.append(Xk)
    return X


samplerate, data = wavfile.read('the_wormhole.wav')

x = data[0:2**16]
X = DFT(x, 2**12)

print("DFT: ")
for val in X:
    print(val)
