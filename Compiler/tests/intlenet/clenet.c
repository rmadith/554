
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include "ops_i32.h"
#include "weights.h"
#include "input.h"

int x1[8192] = {0};
int x2[8192] = {0};


int main() {
    //memcpy(x1, input, 32 * 32 * 1 * sizeof(int));

    for (int i = 0; i < 32 * 32; i++) {
        x1[i] = input[i] * 128;
    }

    conv2d_stride1_int32(x1, w1, b1, x2, 15, 2, 28, 28, 1, 6, 5, 5);
    tanh_int32_inplace(x2, 28 * 28 * 6);
    avgpool2d_2x2_int32(x2, x1, 6, 28, 28);

    conv2d_stride1_int32(x1, w2, b2, x2, 15, 2, 10, 10, 6, 16, 5, 5);
    tanh_int32_inplace(x2, 10 * 10 * 16);
    avgpool2d_2x2_int32(x2, x1, 16, 10, 10);

    conv2d_stride1_int32(x1, w3, b3, x2, 15, 2, 1, 1, 16, 120, 5, 5);
    tanh_int32_inplace(x2, 1 * 1 * 120);

    matmul_int32(x2, w4, b4, x1, 15, 1, 84, 120);
    tanh_int32_inplace(x1, 84);

    matmul_int32(x1, w5, b5, x2, 15, 1, 10, 84);
    float max = 0;
    int final_digit = 0;
    for (int i = 0; i < 10; i++) {
        //printf("%d: %f\n", i, ((float)x2[i]) / 32768.0f);
        if (x2[i] > max) {
            max = x2[i];
            final_digit = i;   
        }
    }
    //printf("final digit %d ref digit %d\n", final_digit, ref_digit);
    return(final_digit);
}
