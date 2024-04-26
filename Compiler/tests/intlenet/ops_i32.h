
void conv2d_stride1_int32(
    int * x,
    int * f,
    int * b,
    int * y,
    int shamt,
    const int pad,
    const int H,
    const int W,
    const int C,
    const int K,
    const int R,
    const int S
) {
    const int XH = H + 2 * pad;
    const int XW = W + 2 * pad;

    for (int k = 0; k < K; k++) {
        for (int h = 0; h < H; h++) {
            for (int w = 0; w < W; w++) {
                // if (k != 0 || h != 1 || w != 12) continue;

                y[k * H * W + h * W + w] = b[k];
                for (int c = 0; c < C; c++) {
                    for (int r = 0; r < R; r++) {
                        for (int s = 0; s < S; s++) {
                            int xh = h + r;
                            int xw = w + s;
                            int xi = x[c * XH * XW + xh * XW + xw];
                            int fi = f[k * C * R * S + c * R * S + r * S + s];
                            int yo = y[k * H * W + h * W + w];

                            y[k * H * W + h * W + w] += (xi * fi) >> shamt;
                            int yn = y[k * H * W + h * W + w];
                            // if (xi > 0) printf("[%d, %d] %d = %d + %d * %d\n",  r, s, yn, yo, xi, fi);
                        }
                    }
                }
            }
        }
    }
}

void matmul_int32(
    int * x,
    int * w,
    int * b,
    int * y,
    const int shamt,
    const int M,
    const int N,
    const int K
) {
    for (int m = 0; m < M; m++) {
        for (int n = 0; n < N; n++) {
            y[m * N + n] = b[n];

            for (int k = 0; k < K; k++) {
                int xi = x[m * K + k];
                int wi = w[n * K + k];
                y[m * N + n] += (xi * wi) >> shamt;
            }

        }
    }
}

void avgpool2d_2x2_int32(
    int * x,
    int * y,
    const int C,
    const int H,
    const int W
) {
    for (int c = 0; c < C; c++) {
        for (int h = 0; h < H / 2; h++) {
            for (int w = 0; w < W / 2; w++) {
                // if (c != 0 || h != 0 || w != 6) continue;

                int xh = 2 * h;
                int xw = 2 * w;
                int x0 = x[c * H * W +       xh * W + xw    ];
                int x1 = x[c * H * W +       xh * W + xw + 1];
                int x2 = x[c * H * W + (xh + 1) * W + xw    ];
                int x3 = x[c * H * W + (xh + 1) * W + xw + 1];

                //printf("%d, %d, %d, %d\n", x0, x1, x2, x3);

                y[c * (H / 2) * (W / 2) + h * (W / 2) + w] =
                    (x0 + x1 + x2 + x3) >> 2;
            }
        }
    }
}

int tanh_15_4_int32_64bins(int x) {
    static const int range_max = 4 * (1 << 15) - 1;

    static int lut[64] = {
        0, 2077, 4138, 6167, 8147, 10066, 11912, 13674, 15346, 16921, 18396,
        19770, 21043, 22216, 23292, 24276, 25171, 25983, 26718, 27380, 27975,
        28510, 28988, 29416, 29797, 30137, 30440, 30709, 30947, 31159, 31347,
        31513, 31660, 31790, 31905, 32007, 32097, 32176, 32246, 32308, 32362,
        32410, 32453, 32490, 32523, 32552, 32578, 32600, 32620, 32638, 32653,
        32667, 32679, 32689, 32699, 32707, 32714, 32720, 32726, 32731, 32735,
        32739, 32743, 32746
    };

    int flip = 1;

    // tanh is symmetric so do abs and then lookup for positive integers only
    if (x < 0) {
        flip = -1;
        x = -x;
    }

    if (x > range_max) x = range_max;

    return flip * lut[(x >> (15 - 4)) & 0x3F];
}

int tanh_15_5_int32_128bins(int x) {
    static const int range_max = 4 * (1 << 15) - 1;

    static int lut[128] = {
        0, 1031, 2061, 3087, 4106, 5118, 6119, 7109, 8086, 9047, 9992, 10919,
        11826, 12714, 13579, 14423, 15243, 16040, 16813, 17561, 18284, 18982,
        19655, 20304, 20927, 21526, 22101, 22651, 23178, 23683, 24164, 24624,
        25063, 25481, 25879, 26258, 26618, 26960, 27285, 27593, 27886, 28163,
        28425, 28674, 28909, 29132, 29342, 29541, 29729, 29906, 30074, 30232,
        30381, 30522, 30654, 30779, 30897, 31008, 31113, 31212, 31304, 31392,
        31474, 31552, 31625, 31693, 31758, 31819, 31876, 31929, 31980, 32028,
        32072, 32114, 32154, 32191, 32226, 32259, 32289, 32318, 32346, 32371,
        32395, 32418, 32439, 32459, 32478, 32495, 32512, 32528, 32542, 32556,
        32569, 32581, 32592, 32603, 32613, 32622, 32631, 32639, 32647, 32655,
        32661, 32668, 32674, 32680, 32685, 32690, 32695, 32699, 32703, 32707,
        32711, 32714, 32718, 32721, 32724, 32726, 32729, 32731, 32733, 32735,
        32737, 32739, 32741, 32743, 32744, 32746
    };

    int flip = 1;

    // tanh is symmetric so do abs and then lookup for positive integers only
    if (x < 0) {
        flip = -1;
        x = -x;
    }

    if (x > range_max) x = range_max;

    return flip * lut[(x >> (15 - 5)) & 0x7F];
}

void tanh_int32_inplace(
    int * x,
    const int N
) {
    for (int i = 0; i < N; i++) {
        x[i] = tanh_15_5_int32_128bins(x[i]);
    }
}
