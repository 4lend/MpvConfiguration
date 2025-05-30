/*
MIT License

Copyright (c) 2020 TianZer

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

/*
  description: Anime4KCPP Net HDN Level 2 GLSL
  Author: TianZerL
*/

//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L1
//!BIND LUMA
//!SAVE L1_1
//!COMPONENTS 4

#define RELU(x) max(x, vec4(0.0f))

const float kernelsL1[9 * 4] = float[9 * 4]
(
-2.0676e-02,  6.7641e-03,  2.8287e-01,
 2.5576e-01,  1.9765e-01, -2.4700e-01,
 3.5056e-01,  2.9306e-01, -2.2245e-01,
 8.4706e-02, -2.9455e-01, -5.5831e-02,
-8.4635e-02, -9.6835e-02,  3.1208e-01,
 1.7690e-01,  2.7624e-02,  5.1954e-02,
-5.3869e-01,  7.2934e-02, -1.7662e-03,
-3.1402e-02,  3.1700e-01,  1.4965e-01,
 3.8569e-02,  5.5025e-03, -6.6555e-03,
-4.2049e-38, -4.1971e-38, -4.1488e-38,
-4.2855e-38, -4.2871e-38, -4.2363e-38,
-4.1861e-38, -4.1974e-38, -4.1677e-38
);

const float biasL1[4] = float[4]
(
-9.0964e-02,  2.1136e-01, -1.2011e-02, -4.5657e-38
);

vec4 hook()
{
    vec4 tl = LUMA_texOff(vec2(-1,-1));
    vec4 tc = LUMA_texOff(vec2(0,-1));
    vec4 tr = LUMA_texOff(vec2(1,-1));
    vec4 ml = LUMA_texOff(vec2(-1,0));
    vec4 mc = LUMA_texOff(vec2(0,0));
    vec4 mr = LUMA_texOff(vec2(1,0));
    vec4 bl = LUMA_texOff(vec2(-1,1));
    vec4 bc = LUMA_texOff(vec2(0,1));
    vec4 br = LUMA_texOff(vec2(1,1));

    vec4 c1234 = RELU(vec4(
        tl.x * kernelsL1[0*9+0] + tc.x * kernelsL1[0*9+1] + tr.x * kernelsL1[0*9+2] +
        ml.x * kernelsL1[0*9+3] + mc.x * kernelsL1[0*9+4] + mr.x * kernelsL1[0*9+5] +
        bl.x * kernelsL1[0*9+6] + bc.x * kernelsL1[0*9+7] + br.x * kernelsL1[0*9+8] + biasL1[0],

        tl.x * kernelsL1[1*9+0] + tc.x * kernelsL1[1*9+1] + tr.x * kernelsL1[1*9+2] +
        ml.x * kernelsL1[1*9+3] + mc.x * kernelsL1[1*9+4] + mr.x * kernelsL1[1*9+5] +
        bl.x * kernelsL1[1*9+6] + bc.x * kernelsL1[1*9+7] + br.x * kernelsL1[1*9+8] + biasL1[1],

        tl.x * kernelsL1[2*9+0] + tc.x * kernelsL1[2*9+1] + tr.x * kernelsL1[2*9+2] +
        ml.x * kernelsL1[2*9+3] + mc.x * kernelsL1[2*9+4] + mr.x * kernelsL1[2*9+5] +
        bl.x * kernelsL1[2*9+6] + bc.x * kernelsL1[2*9+7] + br.x * kernelsL1[2*9+8] + biasL1[2],

        tl.x * kernelsL1[3*9+0] + tc.x * kernelsL1[3*9+1] + tr.x * kernelsL1[3*9+2] +
        ml.x * kernelsL1[3*9+3] + mc.x * kernelsL1[3*9+4] + mr.x * kernelsL1[3*9+5] +
        bl.x * kernelsL1[3*9+6] + bc.x * kernelsL1[3*9+7] + br.x * kernelsL1[3*9+8] + biasL1[3]
    ));


    return c1234;
}

//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L1
//!BIND LUMA
//!SAVE L1_2
//!COMPONENTS 4

#define RELU(x) max(x, vec4(0.0f))

const float kernelsL1[9 * 4] = float[9 * 4]
(
 1.8451e-01, -5.4584e-02,  1.4494e-01,
 1.3433e-01,  1.0073e-01,  2.6371e-01,
 6.1261e-02,  2.2116e-01,  2.0074e-01,
 5.9669e-02, -3.9168e-02,  2.1674e-01,
-2.9132e-01,  3.0285e-03,  1.2625e-01,
-4.3415e-02,  1.8663e-01, -1.6554e-01,
 1.0102e-01,  6.3466e-02,  1.5225e-01,
 2.1692e-01,  1.9860e-01, -7.0456e-02,
-1.6406e-03, -2.7834e-01, -3.5449e-01,
-3.0140e-01, -4.2348e-01, -5.8263e-01,
 2.3140e-01, -2.6843e-01, -1.1069e-01,
-9.1484e-02,  1.1486e-02,  5.6396e-02
);

const float biasL1[4] = float[4]
(
-1.4443e-01, 1.8968e-01, -2.9027e-02,  1.6199e-01
);

vec4 hook()
{
    vec4 tl = LUMA_texOff(vec2(-1,-1));
    vec4 tc = LUMA_texOff(vec2(0,-1));
    vec4 tr = LUMA_texOff(vec2(1,-1));
    vec4 ml = LUMA_texOff(vec2(-1,0));
    vec4 mc = LUMA_texOff(vec2(0,0));
    vec4 mr = LUMA_texOff(vec2(1,0));
    vec4 bl = LUMA_texOff(vec2(-1,1));
    vec4 bc = LUMA_texOff(vec2(0,1));
    vec4 br = LUMA_texOff(vec2(1,1));

    vec4 c5678 = RELU(vec4(
        tl.x * kernelsL1[0*9+0] + tc.x * kernelsL1[0*9+1] + tr.x * kernelsL1[0*9+2] +
        ml.x * kernelsL1[0*9+3] + mc.x * kernelsL1[0*9+4] + mr.x * kernelsL1[0*9+5] +
        bl.x * kernelsL1[0*9+6] + bc.x * kernelsL1[0*9+7] + br.x * kernelsL1[0*9+8] + biasL1[0],

        tl.x * kernelsL1[1*9+0] + tc.x * kernelsL1[1*9+1] + tr.x * kernelsL1[1*9+2] +
        ml.x * kernelsL1[1*9+3] + mc.x * kernelsL1[1*9+4] + mr.x * kernelsL1[1*9+5] +
        bl.x * kernelsL1[1*9+6] + bc.x * kernelsL1[1*9+7] + br.x * kernelsL1[1*9+8] + biasL1[1],

        tl.x * kernelsL1[2*9+0] + tc.x * kernelsL1[2*9+1] + tr.x * kernelsL1[2*9+2] +
        ml.x * kernelsL1[2*9+3] + mc.x * kernelsL1[2*9+4] + mr.x * kernelsL1[2*9+5] +
        bl.x * kernelsL1[2*9+6] + bc.x * kernelsL1[2*9+7] + br.x * kernelsL1[2*9+8] + biasL1[2],

        tl.x * kernelsL1[3*9+0] + tc.x * kernelsL1[3*9+1] + tr.x * kernelsL1[3*9+2] +
        ml.x * kernelsL1[3*9+3] + mc.x * kernelsL1[3*9+4] + mr.x * kernelsL1[3*9+5] +
        bl.x * kernelsL1[3*9+6] + bc.x * kernelsL1[3*9+7] + br.x * kernelsL1[3*9+8] + biasL1[3]
    ));


    return c5678;
}

//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L2
//!BIND L1_1
//!BIND L1_2
//!SAVE L2_1
//!COMPONENTS 4

#define RELU(x) max(x, vec4(0.0f))

const float kernelsL[9 * 8 * 4] = float[9 * 8 * 4]
(
 4.4561e-02,  4.3527e-01, -8.9737e-02,
-4.9011e-03,  1.4879e-01, -8.2210e-02,
-1.7593e-02,  4.9294e-02,  1.8058e-01,
-3.3827e-02, -7.9055e-02,  2.6982e-01,
-5.2485e-02, -4.2046e-01, -5.6838e-02,
 1.0919e-01, -7.3141e-02,  9.4797e-02,
 6.2764e-02,  2.5475e-01,  1.3705e-01,
 2.0997e-01,  7.3360e-01,  2.0801e-01,
-1.1500e-01,  3.1245e-01,  6.7457e-01,
-5.1481e-39, -5.1520e-39, -4.9367e-39,
-5.1383e-39, -5.1642e-39, -4.9479e-39,
-5.1323e-39, -5.1859e-39, -4.9547e-39,
 1.3849e-01,  1.1564e-01, -1.8175e-01,
-5.5355e-03, -1.5117e-01, -2.4654e-01,
 8.1590e-03, -1.1681e-01,  3.4700e-05,
-2.5950e-01, -1.4182e-01,  3.1814e-01,
 1.7662e-01,  1.8420e-01, -1.5181e-01,
 7.6233e-02, -7.8372e-02, -3.1968e-01,
-4.5770e-01,  4.1562e-02,  1.3721e-01,
-5.8444e-02,  3.3148e-02, -2.3370e-01,
 1.5374e-01, -1.1162e-01, -7.4099e-03,
-1.5716e-01, -1.8356e-01,  2.1114e-02,
-3.2233e-01,  2.1064e-02,  2.7019e-01,
-1.3702e-01,  2.6969e-01,  2.1033e-01,
 8.9027e-02, -7.9969e-02,  1.0096e-01,
 6.6773e-02,  3.9558e-02, -7.4944e-02,
-5.9789e-02,  1.2265e-01,  3.3873e-02,
-9.7157e-03,  9.2906e-02,  6.0300e-02,
-2.2104e-03,  6.8198e-02, -1.2931e-01,
 8.9288e-02, -1.2554e-01, -4.3270e-02,
 1.0660e-01,  1.1609e-02, -1.2415e-01,
 2.6372e-02, -3.6311e-02,  1.5625e-01,
-7.9595e-02, -3.3662e-01, -4.0760e-01,
-2.9566e-39, -2.8760e-39, -2.8816e-39,
-2.9566e-39, -2.8964e-39, -2.9115e-39,
-2.9566e-39, -2.9179e-39, -2.9130e-39,
 7.9255e-02,  9.4548e-02,  8.8155e-02,
-2.8163e-02,  1.2428e-01, -6.4973e-03,
 7.7875e-02,  7.4765e-02, -5.2405e-02,
-1.4886e-02, -7.1499e-02, -7.0719e-02,
 9.7562e-02,  9.0948e-02, -5.6588e-02,
-1.2872e-02, -6.6390e-02, -6.4147e-02,
 9.8262e-02, -2.4215e-01, -1.7051e-01,
 1.8096e-01,  1.8106e-01,  1.3108e-01,
 2.0649e-01,  1.2242e-01,  3.7225e-02,
-2.5125e-01, -1.0073e-01,  4.5330e-01,
 1.8588e-01, -2.6809e-01, -1.5709e-01,
 4.7668e-01, -2.4208e-01, -6.6012e-01,
 1.3561e-01,  5.4109e-02,  6.1899e-02,
-1.9605e-02,  1.1349e-01,  3.5781e-02,
 3.5513e-03,  3.1212e-02, -6.0399e-02,
 5.9258e-02, -1.8175e-02,  7.3714e-02,
 2.0052e-02,  4.3245e-02, -5.0879e-03,
-1.1082e-02, -1.0753e-01, -1.7896e-03,
 2.9139e-02,  2.2747e-01, -6.4075e-02,
 7.3097e-02,  1.5703e-01, -5.3815e-01,
 1.0620e-01, -1.1386e-01,  1.7103e-01,
-3.8728e-39, -3.8299e-39, -3.8320e-39,
-3.9065e-39, -3.8445e-39, -3.8135e-39,
-3.8838e-39, -3.8114e-39, -3.8255e-39,
 2.3253e-02,  6.9893e-02,  1.4774e-01,
 9.6087e-02,  2.3102e-03, -3.4449e-02,
 2.6819e-02,  1.0254e-01, -2.8200e-02,
 3.9553e-02,  4.7191e-05, -5.5558e-02,
 4.1641e-02,  5.8706e-02, -1.0337e-01,
 1.1291e-01,  5.9622e-02,  7.0677e-02,
-2.5162e-01,  7.6659e-02,  1.7245e-01,
-5.8522e-02,  1.4365e-01,  2.1189e-01,
-2.8897e-02, -5.7365e-02,  1.4232e-01,
 1.7854e-02,  1.7404e-03, -8.7356e-03,
-6.0777e-02, -6.2687e-02, -1.1500e-02,
-1.6468e-01, -2.5058e-01, -1.2798e-01,
 2.3193e-02,  1.7209e-01,  1.6687e-01,
-3.4483e-02, -1.6846e-02,  2.5930e-02,
 1.4410e-01,  4.2932e-02, -5.0149e-03,
 4.7269e-02,  1.1276e-01, -9.2701e-03,
 1.5323e-02,  1.3552e-02,  9.0256e-02,
-8.9393e-03,  7.0903e-02, -6.9379e-02,
 1.8645e-01,  1.0543e-01, -1.5590e-01,
 2.1056e-01,  1.1051e-01, -1.5514e-01,
-7.0484e-02, -1.5153e-01, -5.0873e-01,
 3.2730e-39,  3.2358e-39,  3.1222e-39,
 3.2642e-39,  3.2358e-39,  3.0921e-39,
 3.2730e-39,  3.2358e-39,  3.0899e-39,
 1.2225e-02,  1.2386e-01,  6.7712e-02,
 3.1263e-02,  1.3617e-01,  1.5352e-01,
 2.3405e-02,  8.5466e-02,  8.7303e-02,
-2.0372e-02,  8.3465e-02, -7.4233e-02,
 1.2269e-01,  8.4046e-02, -3.6869e-02,
 1.0242e-01,  7.3218e-02, -1.1496e-01,
-1.4539e-01, -2.3923e-01, -2.2818e-01,
-3.2368e-02, -7.4360e-02,  2.3493e-02,
 1.7004e-01,  6.2924e-02,  8.9327e-02,
-1.1449e-01, -1.4973e-03, -7.0451e-03,
-9.3205e-02, -1.0312e-01,  4.6503e-02,
-2.2148e-01, -1.8111e-01, -1.1992e-01
);

const float biasL[4] = float[4]
(
 7.2678e-02,  8.5350e-03,  5.0400e-02,  2.6268e-02
);

vec4 hook()
{
    vec4 tl1 = L1_1_texOff(vec2(-1,-1));
    vec4 tc1 = L1_1_texOff(vec2(0,-1));
    vec4 tr1 = L1_1_texOff(vec2(1,-1));
    vec4 ml1 = L1_1_texOff(vec2(-1,0));
    vec4 mc1 = L1_1_texOff(vec2(0,0));
    vec4 mr1 = L1_1_texOff(vec2(1,0));
    vec4 bl1 = L1_1_texOff(vec2(-1,1));
    vec4 bc1 = L1_1_texOff(vec2(0,1));
    vec4 br1 = L1_1_texOff(vec2(1,1));

    vec4 tl2 = L1_2_texOff(vec2(-1,-1));
    vec4 tc2 = L1_2_texOff(vec2(0,-1));
    vec4 tr2 = L1_2_texOff(vec2(1,-1));
    vec4 ml2 = L1_2_texOff(vec2(-1,0));
    vec4 mc2 = L1_2_texOff(vec2(0,0));
    vec4 mr2 = L1_2_texOff(vec2(1,0));
    vec4 bl2 = L1_2_texOff(vec2(-1,1));
    vec4 bc2 = L1_2_texOff(vec2(0,1));
    vec4 br2 = L1_2_texOff(vec2(1,1));

    vec4 c1234 = RELU(vec4(
        tl1.x * kernelsL[0*72+0*9+0] + tc1.x * kernelsL[0*72+0*9+1] + tr1.x * kernelsL[0*72+0*9+2] +
        ml1.x * kernelsL[0*72+0*9+3] + mc1.x * kernelsL[0*72+0*9+4] + mr1.x * kernelsL[0*72+0*9+5] +
        bl1.x * kernelsL[0*72+0*9+6] + bc1.x * kernelsL[0*72+0*9+7] + br1.x * kernelsL[0*72+0*9+8] + 

        tl1.y * kernelsL[0*72+1*9+0] + tc1.y * kernelsL[0*72+1*9+1] + tr1.y * kernelsL[0*72+1*9+2] +
        ml1.y * kernelsL[0*72+1*9+3] + mc1.y * kernelsL[0*72+1*9+4] + mr1.y * kernelsL[0*72+1*9+5] +
        bl1.y * kernelsL[0*72+1*9+6] + bc1.y * kernelsL[0*72+1*9+7] + br1.y * kernelsL[0*72+1*9+8] + 

        tl1.z * kernelsL[0*72+2*9+0] + tc1.z * kernelsL[0*72+2*9+1] + tr1.z * kernelsL[0*72+2*9+2] +
        ml1.z * kernelsL[0*72+2*9+3] + mc1.z * kernelsL[0*72+2*9+4] + mr1.z * kernelsL[0*72+2*9+5] +
        bl1.z * kernelsL[0*72+2*9+6] + bc1.z * kernelsL[0*72+2*9+7] + br1.z * kernelsL[0*72+2*9+8] + 

        tl1.w * kernelsL[0*72+3*9+0] + tc1.w * kernelsL[0*72+3*9+1] + tr1.w * kernelsL[0*72+3*9+2] +
        ml1.w * kernelsL[0*72+3*9+3] + mc1.w * kernelsL[0*72+3*9+4] + mr1.w * kernelsL[0*72+3*9+5] +
        bl1.w * kernelsL[0*72+3*9+6] + bc1.w * kernelsL[0*72+3*9+7] + br1.w * kernelsL[0*72+3*9+8] +

        tl2.x * kernelsL[0*72+4*9+0] + tc2.x * kernelsL[0*72+4*9+1] + tr2.x * kernelsL[0*72+4*9+2] +
        ml2.x * kernelsL[0*72+4*9+3] + mc2.x * kernelsL[0*72+4*9+4] + mr2.x * kernelsL[0*72+4*9+5] +
        bl2.x * kernelsL[0*72+4*9+6] + bc2.x * kernelsL[0*72+4*9+7] + br2.x * kernelsL[0*72+4*9+8] + 

        tl2.y * kernelsL[0*72+5*9+0] + tc2.y * kernelsL[0*72+5*9+1] + tr2.y * kernelsL[0*72+5*9+2] +
        ml2.y * kernelsL[0*72+5*9+3] + mc2.y * kernelsL[0*72+5*9+4] + mr2.y * kernelsL[0*72+5*9+5] +
        bl2.y * kernelsL[0*72+5*9+6] + bc2.y * kernelsL[0*72+5*9+7] + br2.y * kernelsL[0*72+5*9+8] + 

        tl2.z * kernelsL[0*72+6*9+0] + tc2.z * kernelsL[0*72+6*9+1] + tr2.z * kernelsL[0*72+6*9+2] +
        ml2.z * kernelsL[0*72+6*9+3] + mc2.z * kernelsL[0*72+6*9+4] + mr2.z * kernelsL[0*72+6*9+5] +
        bl2.z * kernelsL[0*72+6*9+6] + bc2.z * kernelsL[0*72+6*9+7] + br2.z * kernelsL[0*72+6*9+8] + 

        tl2.w * kernelsL[0*72+7*9+0] + tc2.w * kernelsL[0*72+7*9+1] + tr2.w * kernelsL[0*72+7*9+2] +
        ml2.w * kernelsL[0*72+7*9+3] + mc2.w * kernelsL[0*72+7*9+4] + mr2.w * kernelsL[0*72+7*9+5] +
        bl2.w * kernelsL[0*72+7*9+6] + bc2.w * kernelsL[0*72+7*9+7] + br2.w * kernelsL[0*72+7*9+8] + biasL[0]
        ,
        tl1.x * kernelsL[1*72+0*9+0] + tc1.x * kernelsL[1*72+0*9+1] + tr1.x * kernelsL[1*72+0*9+2] +
        ml1.x * kernelsL[1*72+0*9+3] + mc1.x * kernelsL[1*72+0*9+4] + mr1.x * kernelsL[1*72+0*9+5] +
        bl1.x * kernelsL[1*72+0*9+6] + bc1.x * kernelsL[1*72+0*9+7] + br1.x * kernelsL[1*72+0*9+8] + 

        tl1.y * kernelsL[1*72+1*9+0] + tc1.y * kernelsL[1*72+1*9+1] + tr1.y * kernelsL[1*72+1*9+2] +
        ml1.y * kernelsL[1*72+1*9+3] + mc1.y * kernelsL[1*72+1*9+4] + mr1.y * kernelsL[1*72+1*9+5] +
        bl1.y * kernelsL[1*72+1*9+6] + bc1.y * kernelsL[1*72+1*9+7] + br1.y * kernelsL[1*72+1*9+8] + 

        tl1.z * kernelsL[1*72+2*9+0] + tc1.z * kernelsL[1*72+2*9+1] + tr1.z * kernelsL[1*72+2*9+2] +
        ml1.z * kernelsL[1*72+2*9+3] + mc1.z * kernelsL[1*72+2*9+4] + mr1.z * kernelsL[1*72+2*9+5] +
        bl1.z * kernelsL[1*72+2*9+6] + bc1.z * kernelsL[1*72+2*9+7] + br1.z * kernelsL[1*72+2*9+8] + 

        tl1.w * kernelsL[1*72+3*9+0] + tc1.w * kernelsL[1*72+3*9+1] + tr1.w * kernelsL[1*72+3*9+2] +
        ml1.w * kernelsL[1*72+3*9+3] + mc1.w * kernelsL[1*72+3*9+4] + mr1.w * kernelsL[1*72+3*9+5] +
        bl1.w * kernelsL[1*72+3*9+6] + bc1.w * kernelsL[1*72+3*9+7] + br1.w * kernelsL[1*72+3*9+8] +

        tl2.x * kernelsL[1*72+4*9+0] + tc2.x * kernelsL[1*72+4*9+1] + tr2.x * kernelsL[1*72+4*9+2] +
        ml2.x * kernelsL[1*72+4*9+3] + mc2.x * kernelsL[1*72+4*9+4] + mr2.x * kernelsL[1*72+4*9+5] +
        bl2.x * kernelsL[1*72+4*9+6] + bc2.x * kernelsL[1*72+4*9+7] + br2.x * kernelsL[1*72+4*9+8] + 

        tl2.y * kernelsL[1*72+5*9+0] + tc2.y * kernelsL[1*72+5*9+1] + tr2.y * kernelsL[1*72+5*9+2] +
        ml2.y * kernelsL[1*72+5*9+3] + mc2.y * kernelsL[1*72+5*9+4] + mr2.y * kernelsL[1*72+5*9+5] +
        bl2.y * kernelsL[1*72+5*9+6] + bc2.y * kernelsL[1*72+5*9+7] + br2.y * kernelsL[1*72+5*9+8] + 

        tl2.z * kernelsL[1*72+6*9+0] + tc2.z * kernelsL[1*72+6*9+1] + tr2.z * kernelsL[1*72+6*9+2] +
        ml2.z * kernelsL[1*72+6*9+3] + mc2.z * kernelsL[1*72+6*9+4] + mr2.z * kernelsL[1*72+6*9+5] +
        bl2.z * kernelsL[1*72+6*9+6] + bc2.z * kernelsL[1*72+6*9+7] + br2.z * kernelsL[1*72+6*9+8] + 

        tl2.w * kernelsL[1*72+7*9+0] + tc2.w * kernelsL[1*72+7*9+1] + tr2.w * kernelsL[1*72+7*9+2] +
        ml2.w * kernelsL[1*72+7*9+3] + mc2.w * kernelsL[1*72+7*9+4] + mr2.w * kernelsL[1*72+7*9+5] +
        bl2.w * kernelsL[1*72+7*9+6] + bc2.w * kernelsL[1*72+7*9+7] + br2.w * kernelsL[1*72+7*9+8] + biasL[1]
        ,
        tl1.x * kernelsL[2*72+0*9+0] + tc1.x * kernelsL[2*72+0*9+1] + tr1.x * kernelsL[2*72+0*9+2] +
        ml1.x * kernelsL[2*72+0*9+3] + mc1.x * kernelsL[2*72+0*9+4] + mr1.x * kernelsL[2*72+0*9+5] +
        bl1.x * kernelsL[2*72+0*9+6] + bc1.x * kernelsL[2*72+0*9+7] + br1.x * kernelsL[2*72+0*9+8] + 

        tl1.y * kernelsL[2*72+1*9+0] + tc1.y * kernelsL[2*72+1*9+1] + tr1.y * kernelsL[2*72+1*9+2] +
        ml1.y * kernelsL[2*72+1*9+3] + mc1.y * kernelsL[2*72+1*9+4] + mr1.y * kernelsL[2*72+1*9+5] +
        bl1.y * kernelsL[2*72+1*9+6] + bc1.y * kernelsL[2*72+1*9+7] + br1.y * kernelsL[2*72+1*9+8] + 

        tl1.z * kernelsL[2*72+2*9+0] + tc1.z * kernelsL[2*72+2*9+1] + tr1.z * kernelsL[2*72+2*9+2] +
        ml1.z * kernelsL[2*72+2*9+3] + mc1.z * kernelsL[2*72+2*9+4] + mr1.z * kernelsL[2*72+2*9+5] +
        bl1.z * kernelsL[2*72+2*9+6] + bc1.z * kernelsL[2*72+2*9+7] + br1.z * kernelsL[2*72+2*9+8] + 

        tl1.w * kernelsL[2*72+3*9+0] + tc1.w * kernelsL[2*72+3*9+1] + tr1.w * kernelsL[2*72+3*9+2] +
        ml1.w * kernelsL[2*72+3*9+3] + mc1.w * kernelsL[2*72+3*9+4] + mr1.w * kernelsL[2*72+3*9+5] +
        bl1.w * kernelsL[2*72+3*9+6] + bc1.w * kernelsL[2*72+3*9+7] + br1.w * kernelsL[2*72+3*9+8] +

        tl2.x * kernelsL[2*72+4*9+0] + tc2.x * kernelsL[2*72+4*9+1] + tr2.x * kernelsL[2*72+4*9+2] +
        ml2.x * kernelsL[2*72+4*9+3] + mc2.x * kernelsL[2*72+4*9+4] + mr2.x * kernelsL[2*72+4*9+5] +
        bl2.x * kernelsL[2*72+4*9+6] + bc2.x * kernelsL[2*72+4*9+7] + br2.x * kernelsL[2*72+4*9+8] + 

        tl2.y * kernelsL[2*72+5*9+0] + tc2.y * kernelsL[2*72+5*9+1] + tr2.y * kernelsL[2*72+5*9+2] +
        ml2.y * kernelsL[2*72+5*9+3] + mc2.y * kernelsL[2*72+5*9+4] + mr2.y * kernelsL[2*72+5*9+5] +
        bl2.y * kernelsL[2*72+5*9+6] + bc2.y * kernelsL[2*72+5*9+7] + br2.y * kernelsL[2*72+5*9+8] + 

        tl2.z * kernelsL[2*72+6*9+0] + tc2.z * kernelsL[2*72+6*9+1] + tr2.z * kernelsL[2*72+6*9+2] +
        ml2.z * kernelsL[2*72+6*9+3] + mc2.z * kernelsL[2*72+6*9+4] + mr2.z * kernelsL[2*72+6*9+5] +
        bl2.z * kernelsL[2*72+6*9+6] + bc2.z * kernelsL[2*72+6*9+7] + br2.z * kernelsL[2*72+6*9+8] + 

        tl2.w * kernelsL[2*72+7*9+0] + tc2.w * kernelsL[2*72+7*9+1] + tr2.w * kernelsL[2*72+7*9+2] +
        ml2.w * kernelsL[2*72+7*9+3] + mc2.w * kernelsL[2*72+7*9+4] + mr2.w * kernelsL[2*72+7*9+5] +
        bl2.w * kernelsL[2*72+7*9+6] + bc2.w * kernelsL[2*72+7*9+7] + br2.w * kernelsL[2*72+7*9+8] + biasL[2]
        ,
        tl1.x * kernelsL[3*72+0*9+0] + tc1.x * kernelsL[3*72+0*9+1] + tr1.x * kernelsL[3*72+0*9+2] +
        ml1.x * kernelsL[3*72+0*9+3] + mc1.x * kernelsL[3*72+0*9+4] + mr1.x * kernelsL[3*72+0*9+5] +
        bl1.x * kernelsL[3*72+0*9+6] + bc1.x * kernelsL[3*72+0*9+7] + br1.x * kernelsL[3*72+0*9+8] + 

        tl1.y * kernelsL[3*72+1*9+0] + tc1.y * kernelsL[3*72+1*9+1] + tr1.y * kernelsL[3*72+1*9+2] +
        ml1.y * kernelsL[3*72+1*9+3] + mc1.y * kernelsL[3*72+1*9+4] + mr1.y * kernelsL[3*72+1*9+5] +
        bl1.y * kernelsL[3*72+1*9+6] + bc1.y * kernelsL[3*72+1*9+7] + br1.y * kernelsL[3*72+1*9+8] + 

        tl1.z * kernelsL[3*72+2*9+0] + tc1.z * kernelsL[3*72+2*9+1] + tr1.z * kernelsL[3*72+2*9+2] +
        ml1.z * kernelsL[3*72+2*9+3] + mc1.z * kernelsL[3*72+2*9+4] + mr1.z * kernelsL[3*72+2*9+5] +
        bl1.z * kernelsL[3*72+2*9+6] + bc1.z * kernelsL[3*72+2*9+7] + br1.z * kernelsL[3*72+2*9+8] + 

        tl1.w * kernelsL[3*72+3*9+0] + tc1.w * kernelsL[3*72+3*9+1] + tr1.w * kernelsL[3*72+3*9+2] +
        ml1.w * kernelsL[3*72+3*9+3] + mc1.w * kernelsL[3*72+3*9+4] + mr1.w * kernelsL[3*72+3*9+5] +
        bl1.w * kernelsL[3*72+3*9+6] + bc1.w * kernelsL[3*72+3*9+7] + br1.w * kernelsL[3*72+3*9+8] +

        tl2.x * kernelsL[3*72+4*9+0] + tc2.x * kernelsL[3*72+4*9+1] + tr2.x * kernelsL[3*72+4*9+2] +
        ml2.x * kernelsL[3*72+4*9+3] + mc2.x * kernelsL[3*72+4*9+4] + mr2.x * kernelsL[3*72+4*9+5] +
        bl2.x * kernelsL[3*72+4*9+6] + bc2.x * kernelsL[3*72+4*9+7] + br2.x * kernelsL[3*72+4*9+8] + 

        tl2.y * kernelsL[3*72+5*9+0] + tc2.y * kernelsL[3*72+5*9+1] + tr2.y * kernelsL[3*72+5*9+2] +
        ml2.y * kernelsL[3*72+5*9+3] + mc2.y * kernelsL[3*72+5*9+4] + mr2.y * kernelsL[3*72+5*9+5] +
        bl2.y * kernelsL[3*72+5*9+6] + bc2.y * kernelsL[3*72+5*9+7] + br2.y * kernelsL[3*72+5*9+8] + 

        tl2.z * kernelsL[3*72+6*9+0] + tc2.z * kernelsL[3*72+6*9+1] + tr2.z * kernelsL[3*72+6*9+2] +
        ml2.z * kernelsL[3*72+6*9+3] + mc2.z * kernelsL[3*72+6*9+4] + mr2.z * kernelsL[3*72+6*9+5] +
        bl2.z * kernelsL[3*72+6*9+6] + bc2.z * kernelsL[3*72+6*9+7] + br2.z * kernelsL[3*72+6*9+8] + 

        tl2.w * kernelsL[3*72+7*9+0] + tc2.w * kernelsL[3*72+7*9+1] + tr2.w * kernelsL[3*72+7*9+2] +
        ml2.w * kernelsL[3*72+7*9+3] + mc2.w * kernelsL[3*72+7*9+4] + mr2.w * kernelsL[3*72+7*9+5] +
        bl2.w * kernelsL[3*72+7*9+6] + bc2.w * kernelsL[3*72+7*9+7] + br2.w * kernelsL[3*72+7*9+8] + biasL[3]
    ));


    return c1234;
}


//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L2
//!BIND L1_1
//!BIND L1_2
//!SAVE L2_2
//!COMPONENTS 4

#define RELU(x) max(x, vec4(0.0f))

const float kernelsL[9 * 8 * 4] = float[9 * 8 * 4]
(
 9.8140e-02,  9.9823e-02, -2.0282e-02,
-8.1973e-02,  1.4255e-01, -5.2392e-02,
 8.0350e-03, -4.8299e-02, -7.7908e-02,
 4.2383e-02,  3.0707e-02,  2.8560e-02,
 1.0437e-01,  6.1290e-02, -9.7796e-02,
-1.7125e-02, -1.3572e-01, -1.5345e-01,
-1.3292e-01,  2.9477e-02,  6.8032e-02,
 1.5741e-01,  4.0258e-01,  2.5838e-01,
 1.3948e-01,  3.5713e-01, -3.9825e-01,
-1.9224e-39, -2.4076e-39, -2.4529e-39,
-1.9181e-39, -1.9894e-39, -4.0240e-39,
-1.9335e-39, -2.3920e-39, -4.0147e-39,
-2.1714e-02, -3.5299e-02, -7.5803e-03,
-2.4087e-02,  7.5265e-02,  7.6697e-02,
 4.5309e-02,  8.9529e-02,  7.6510e-03,
 1.0813e-02,  3.1294e-02, -2.5907e-02,
 1.1962e-02, -6.8664e-03, -1.4084e-01,
 7.7013e-02, -1.2305e-01, -6.7800e-02,
-9.7392e-02,  4.4082e-02,  1.4473e-01,
 4.9436e-02,  2.8859e-01,  2.8252e-01,
-3.5828e-02, -7.5616e-02,  2.4875e-01,
-6.7684e-02,  1.1290e-01,  4.2827e-02,
-1.0860e-01,  1.2952e-01,  5.9784e-01,
-3.5402e-01, -3.9558e-02, -6.0775e-01,
-1.2854e-02,  1.5240e-01,  1.4115e-01,
-2.8134e-02, -1.2939e-02, -2.6203e-02,
 1.1300e-01,  1.4481e-01, -5.1454e-02,
 1.2688e-01,  2.8536e-02,  9.4877e-02,
 9.6033e-02, -1.3901e-02,  6.0035e-02,
-1.1249e-01,  4.3971e-02, -1.0918e-01,
 8.2500e-02,  2.1413e-01,  3.9015e-02,
 1.8361e-01,  2.5271e-01, -2.2794e-01,
-8.1195e-02, -1.2269e-01, -2.6097e-01,
 7.6827e-39,  7.7882e-39,  7.6893e-39,
 7.7006e-39,  7.7857e-39,  7.7384e-39,
 7.6985e-39,  7.7712e-39,  7.7399e-39,
 1.4458e-02,  1.0801e-01,  1.5906e-01,
-1.4676e-02,  1.3699e-01,  9.2460e-02,
-3.6479e-02,  1.4529e-01, -2.8681e-02,
-3.3251e-02, -7.3096e-02, -1.4330e-01,
 5.7009e-02, -3.1905e-02, -1.2035e-01,
 1.1838e-01,  5.7011e-02,  2.0800e-02,
-1.1567e-02, -2.2125e-01, -9.3953e-02,
-7.5378e-02, -1.2069e-01,  1.3217e-01,
-7.7357e-02, -1.3171e-01,  1.2776e-01,
-1.1397e-01, -3.5183e-02,  2.2994e-02,
-6.5101e-02, -1.5019e-01, -2.7451e-02,
-2.4260e-01, -1.3543e-01, -1.9889e-02,
-1.9798e-39, -3.5282e-40, -1.9216e-39,
-1.9140e-39, -1.9370e-39, -1.9943e-39,
-1.8623e-39, -1.8665e-39, -1.9320e-39,
-4.8850e-39, -5.0283e-39, -4.9987e-39,
-5.0868e-39, -5.0814e-39, -5.0779e-39,
-5.2489e-39, -5.1086e-39, -5.1234e-39,
-2.9120e-39, -3.0278e-39, -2.9633e-39,
 1.3186e-39,  6.0555e-39,  6.0419e-39,
-5.5922e-39, -8.5992e-40, -2.8529e-39,
-3.4668e-39, -3.5127e-39, -3.4668e-39,
-3.2831e-39, -3.4668e-39, -3.6734e-39,
-3.2142e-39, -3.2831e-39, -3.5816e-39,
 1.3445e-39,  1.3621e-39,  1.3375e-39,
 1.4539e-39, -2.2695e-40,  1.4522e-39,
 1.3563e-39,  1.3339e-39,  1.3001e-39,
-4.4670e-39, -4.4026e-39, -4.3159e-39,
-4.5047e-39, -4.3505e-39, -2.7259e-39,
-4.5265e-39, -4.4721e-39, -4.4990e-39,
-1.9864e-39, -4.1379e-39, -3.7189e-39,
 5.2465e-39,  2.5220e-39,  1.5639e-39,
-3.9760e-39, -5.7033e-39, -4.0978e-39,
-6.3745e-40, -4.7511e-39,  2.3456e-39,
-1.5164e-39,  5.0431e-39,  5.1197e-39,
 8.7052e-40,  1.4947e-39, -1.1546e-39,
 5.3140e-02,  1.0281e-01,  1.4767e-01,
-6.1530e-02, -9.4166e-02,  4.8671e-02,
 5.6787e-03, -1.4551e-01,  1.5614e-02,
-3.4826e-02, -5.1148e-02,  9.7079e-02,
-1.3603e-02, -1.2249e-01, -1.9330e-02,
-6.8184e-02, -1.4344e-01, -9.4023e-03,
-7.4629e-02,  3.9634e-02,  1.3445e-01,
 4.2153e-02,  7.1129e-01,  2.8703e-02,
 7.8247e-02,  7.2210e-01, -6.6198e-01,
-6.1010e-39, -6.2892e-39, -6.4008e-39,
-6.0825e-39, -6.3221e-39, -6.3883e-39,
-1.4962e-39, -1.1702e-39, -1.2143e-39,
 5.5512e-02, -2.1522e-02,  1.0866e-01,
-9.2812e-02, -3.5119e-02,  1.1396e-01,
-1.3922e-01,  6.7287e-02, -5.5626e-02,
-2.0492e-01,  8.1441e-02, -1.3513e-01,
 4.7447e-02,  2.0081e-01, -3.1249e-01,
-1.8546e-02,  2.0680e-01,  7.3979e-02,
 8.8928e-02, -4.3606e-01, -8.4823e-02,
-5.6133e-02,  3.5132e-01,  1.8633e-01,
-4.3855e-03,  5.4869e-02,  1.1658e-01,
 1.7423e-01, -5.3107e-02,  2.2925e-02,
-1.7622e-01,  4.4453e-02,  2.8131e-02,
 2.6863e-01, -2.9085e-01, -1.5098e-01
);

const float biasL[4] = float[4]
(
 6.2434e-02, 1.0483e-01, -7.1650e-39,  1.0062e-01
);

vec4 hook()
{
    vec4 tl1 = L1_1_texOff(vec2(-1,-1));
    vec4 tc1 = L1_1_texOff(vec2(0,-1));
    vec4 tr1 = L1_1_texOff(vec2(1,-1));
    vec4 ml1 = L1_1_texOff(vec2(-1,0));
    vec4 mc1 = L1_1_texOff(vec2(0,0));
    vec4 mr1 = L1_1_texOff(vec2(1,0));
    vec4 bl1 = L1_1_texOff(vec2(-1,1));
    vec4 bc1 = L1_1_texOff(vec2(0,1));
    vec4 br1 = L1_1_texOff(vec2(1,1));

    vec4 tl2 = L1_2_texOff(vec2(-1,-1));
    vec4 tc2 = L1_2_texOff(vec2(0,-1));
    vec4 tr2 = L1_2_texOff(vec2(1,-1));
    vec4 ml2 = L1_2_texOff(vec2(-1,0));
    vec4 mc2 = L1_2_texOff(vec2(0,0));
    vec4 mr2 = L1_2_texOff(vec2(1,0));
    vec4 bl2 = L1_2_texOff(vec2(-1,1));
    vec4 bc2 = L1_2_texOff(vec2(0,1));
    vec4 br2 = L1_2_texOff(vec2(1,1));

    vec4 c5678 = RELU(vec4(
        tl1.x * kernelsL[0*72+0*9+0] + tc1.x * kernelsL[0*72+0*9+1] + tr1.x * kernelsL[0*72+0*9+2] +
        ml1.x * kernelsL[0*72+0*9+3] + mc1.x * kernelsL[0*72+0*9+4] + mr1.x * kernelsL[0*72+0*9+5] +
        bl1.x * kernelsL[0*72+0*9+6] + bc1.x * kernelsL[0*72+0*9+7] + br1.x * kernelsL[0*72+0*9+8] + 

        tl1.y * kernelsL[0*72+1*9+0] + tc1.y * kernelsL[0*72+1*9+1] + tr1.y * kernelsL[0*72+1*9+2] +
        ml1.y * kernelsL[0*72+1*9+3] + mc1.y * kernelsL[0*72+1*9+4] + mr1.y * kernelsL[0*72+1*9+5] +
        bl1.y * kernelsL[0*72+1*9+6] + bc1.y * kernelsL[0*72+1*9+7] + br1.y * kernelsL[0*72+1*9+8] + 

        tl1.z * kernelsL[0*72+2*9+0] + tc1.z * kernelsL[0*72+2*9+1] + tr1.z * kernelsL[0*72+2*9+2] +
        ml1.z * kernelsL[0*72+2*9+3] + mc1.z * kernelsL[0*72+2*9+4] + mr1.z * kernelsL[0*72+2*9+5] +
        bl1.z * kernelsL[0*72+2*9+6] + bc1.z * kernelsL[0*72+2*9+7] + br1.z * kernelsL[0*72+2*9+8] + 

        tl1.w * kernelsL[0*72+3*9+0] + tc1.w * kernelsL[0*72+3*9+1] + tr1.w * kernelsL[0*72+3*9+2] +
        ml1.w * kernelsL[0*72+3*9+3] + mc1.w * kernelsL[0*72+3*9+4] + mr1.w * kernelsL[0*72+3*9+5] +
        bl1.w * kernelsL[0*72+3*9+6] + bc1.w * kernelsL[0*72+3*9+7] + br1.w * kernelsL[0*72+3*9+8] +

        tl2.x * kernelsL[0*72+4*9+0] + tc2.x * kernelsL[0*72+4*9+1] + tr2.x * kernelsL[0*72+4*9+2] +
        ml2.x * kernelsL[0*72+4*9+3] + mc2.x * kernelsL[0*72+4*9+4] + mr2.x * kernelsL[0*72+4*9+5] +
        bl2.x * kernelsL[0*72+4*9+6] + bc2.x * kernelsL[0*72+4*9+7] + br2.x * kernelsL[0*72+4*9+8] + 

        tl2.y * kernelsL[0*72+5*9+0] + tc2.y * kernelsL[0*72+5*9+1] + tr2.y * kernelsL[0*72+5*9+2] +
        ml2.y * kernelsL[0*72+5*9+3] + mc2.y * kernelsL[0*72+5*9+4] + mr2.y * kernelsL[0*72+5*9+5] +
        bl2.y * kernelsL[0*72+5*9+6] + bc2.y * kernelsL[0*72+5*9+7] + br2.y * kernelsL[0*72+5*9+8] + 

        tl2.z * kernelsL[0*72+6*9+0] + tc2.z * kernelsL[0*72+6*9+1] + tr2.z * kernelsL[0*72+6*9+2] +
        ml2.z * kernelsL[0*72+6*9+3] + mc2.z * kernelsL[0*72+6*9+4] + mr2.z * kernelsL[0*72+6*9+5] +
        bl2.z * kernelsL[0*72+6*9+6] + bc2.z * kernelsL[0*72+6*9+7] + br2.z * kernelsL[0*72+6*9+8] + 

        tl2.w * kernelsL[0*72+7*9+0] + tc2.w * kernelsL[0*72+7*9+1] + tr2.w * kernelsL[0*72+7*9+2] +
        ml2.w * kernelsL[0*72+7*9+3] + mc2.w * kernelsL[0*72+7*9+4] + mr2.w * kernelsL[0*72+7*9+5] +
        bl2.w * kernelsL[0*72+7*9+6] + bc2.w * kernelsL[0*72+7*9+7] + br2.w * kernelsL[0*72+7*9+8] + biasL[0]
        ,
        tl1.x * kernelsL[1*72+0*9+0] + tc1.x * kernelsL[1*72+0*9+1] + tr1.x * kernelsL[1*72+0*9+2] +
        ml1.x * kernelsL[1*72+0*9+3] + mc1.x * kernelsL[1*72+0*9+4] + mr1.x * kernelsL[1*72+0*9+5] +
        bl1.x * kernelsL[1*72+0*9+6] + bc1.x * kernelsL[1*72+0*9+7] + br1.x * kernelsL[1*72+0*9+8] + 

        tl1.y * kernelsL[1*72+1*9+0] + tc1.y * kernelsL[1*72+1*9+1] + tr1.y * kernelsL[1*72+1*9+2] +
        ml1.y * kernelsL[1*72+1*9+3] + mc1.y * kernelsL[1*72+1*9+4] + mr1.y * kernelsL[1*72+1*9+5] +
        bl1.y * kernelsL[1*72+1*9+6] + bc1.y * kernelsL[1*72+1*9+7] + br1.y * kernelsL[1*72+1*9+8] + 

        tl1.z * kernelsL[1*72+2*9+0] + tc1.z * kernelsL[1*72+2*9+1] + tr1.z * kernelsL[1*72+2*9+2] +
        ml1.z * kernelsL[1*72+2*9+3] + mc1.z * kernelsL[1*72+2*9+4] + mr1.z * kernelsL[1*72+2*9+5] +
        bl1.z * kernelsL[1*72+2*9+6] + bc1.z * kernelsL[1*72+2*9+7] + br1.z * kernelsL[1*72+2*9+8] + 

        tl1.w * kernelsL[1*72+3*9+0] + tc1.w * kernelsL[1*72+3*9+1] + tr1.w * kernelsL[1*72+3*9+2] +
        ml1.w * kernelsL[1*72+3*9+3] + mc1.w * kernelsL[1*72+3*9+4] + mr1.w * kernelsL[1*72+3*9+5] +
        bl1.w * kernelsL[1*72+3*9+6] + bc1.w * kernelsL[1*72+3*9+7] + br1.w * kernelsL[1*72+3*9+8] +

        tl2.x * kernelsL[1*72+4*9+0] + tc2.x * kernelsL[1*72+4*9+1] + tr2.x * kernelsL[1*72+4*9+2] +
        ml2.x * kernelsL[1*72+4*9+3] + mc2.x * kernelsL[1*72+4*9+4] + mr2.x * kernelsL[1*72+4*9+5] +
        bl2.x * kernelsL[1*72+4*9+6] + bc2.x * kernelsL[1*72+4*9+7] + br2.x * kernelsL[1*72+4*9+8] + 

        tl2.y * kernelsL[1*72+5*9+0] + tc2.y * kernelsL[1*72+5*9+1] + tr2.y * kernelsL[1*72+5*9+2] +
        ml2.y * kernelsL[1*72+5*9+3] + mc2.y * kernelsL[1*72+5*9+4] + mr2.y * kernelsL[1*72+5*9+5] +
        bl2.y * kernelsL[1*72+5*9+6] + bc2.y * kernelsL[1*72+5*9+7] + br2.y * kernelsL[1*72+5*9+8] + 

        tl2.z * kernelsL[1*72+6*9+0] + tc2.z * kernelsL[1*72+6*9+1] + tr2.z * kernelsL[1*72+6*9+2] +
        ml2.z * kernelsL[1*72+6*9+3] + mc2.z * kernelsL[1*72+6*9+4] + mr2.z * kernelsL[1*72+6*9+5] +
        bl2.z * kernelsL[1*72+6*9+6] + bc2.z * kernelsL[1*72+6*9+7] + br2.z * kernelsL[1*72+6*9+8] + 

        tl2.w * kernelsL[1*72+7*9+0] + tc2.w * kernelsL[1*72+7*9+1] + tr2.w * kernelsL[1*72+7*9+2] +
        ml2.w * kernelsL[1*72+7*9+3] + mc2.w * kernelsL[1*72+7*9+4] + mr2.w * kernelsL[1*72+7*9+5] +
        bl2.w * kernelsL[1*72+7*9+6] + bc2.w * kernelsL[1*72+7*9+7] + br2.w * kernelsL[1*72+7*9+8] + biasL[1]
        ,
        tl1.x * kernelsL[2*72+0*9+0] + tc1.x * kernelsL[2*72+0*9+1] + tr1.x * kernelsL[2*72+0*9+2] +
        ml1.x * kernelsL[2*72+0*9+3] + mc1.x * kernelsL[2*72+0*9+4] + mr1.x * kernelsL[2*72+0*9+5] +
        bl1.x * kernelsL[2*72+0*9+6] + bc1.x * kernelsL[2*72+0*9+7] + br1.x * kernelsL[2*72+0*9+8] + 

        tl1.y * kernelsL[2*72+1*9+0] + tc1.y * kernelsL[2*72+1*9+1] + tr1.y * kernelsL[2*72+1*9+2] +
        ml1.y * kernelsL[2*72+1*9+3] + mc1.y * kernelsL[2*72+1*9+4] + mr1.y * kernelsL[2*72+1*9+5] +
        bl1.y * kernelsL[2*72+1*9+6] + bc1.y * kernelsL[2*72+1*9+7] + br1.y * kernelsL[2*72+1*9+8] + 

        tl1.z * kernelsL[2*72+2*9+0] + tc1.z * kernelsL[2*72+2*9+1] + tr1.z * kernelsL[2*72+2*9+2] +
        ml1.z * kernelsL[2*72+2*9+3] + mc1.z * kernelsL[2*72+2*9+4] + mr1.z * kernelsL[2*72+2*9+5] +
        bl1.z * kernelsL[2*72+2*9+6] + bc1.z * kernelsL[2*72+2*9+7] + br1.z * kernelsL[2*72+2*9+8] + 

        tl1.w * kernelsL[2*72+3*9+0] + tc1.w * kernelsL[2*72+3*9+1] + tr1.w * kernelsL[2*72+3*9+2] +
        ml1.w * kernelsL[2*72+3*9+3] + mc1.w * kernelsL[2*72+3*9+4] + mr1.w * kernelsL[2*72+3*9+5] +
        bl1.w * kernelsL[2*72+3*9+6] + bc1.w * kernelsL[2*72+3*9+7] + br1.w * kernelsL[2*72+3*9+8] +

        tl2.x * kernelsL[2*72+4*9+0] + tc2.x * kernelsL[2*72+4*9+1] + tr2.x * kernelsL[2*72+4*9+2] +
        ml2.x * kernelsL[2*72+4*9+3] + mc2.x * kernelsL[2*72+4*9+4] + mr2.x * kernelsL[2*72+4*9+5] +
        bl2.x * kernelsL[2*72+4*9+6] + bc2.x * kernelsL[2*72+4*9+7] + br2.x * kernelsL[2*72+4*9+8] + 

        tl2.y * kernelsL[2*72+5*9+0] + tc2.y * kernelsL[2*72+5*9+1] + tr2.y * kernelsL[2*72+5*9+2] +
        ml2.y * kernelsL[2*72+5*9+3] + mc2.y * kernelsL[2*72+5*9+4] + mr2.y * kernelsL[2*72+5*9+5] +
        bl2.y * kernelsL[2*72+5*9+6] + bc2.y * kernelsL[2*72+5*9+7] + br2.y * kernelsL[2*72+5*9+8] + 

        tl2.z * kernelsL[2*72+6*9+0] + tc2.z * kernelsL[2*72+6*9+1] + tr2.z * kernelsL[2*72+6*9+2] +
        ml2.z * kernelsL[2*72+6*9+3] + mc2.z * kernelsL[2*72+6*9+4] + mr2.z * kernelsL[2*72+6*9+5] +
        bl2.z * kernelsL[2*72+6*9+6] + bc2.z * kernelsL[2*72+6*9+7] + br2.z * kernelsL[2*72+6*9+8] + 

        tl2.w * kernelsL[2*72+7*9+0] + tc2.w * kernelsL[2*72+7*9+1] + tr2.w * kernelsL[2*72+7*9+2] +
        ml2.w * kernelsL[2*72+7*9+3] + mc2.w * kernelsL[2*72+7*9+4] + mr2.w * kernelsL[2*72+7*9+5] +
        bl2.w * kernelsL[2*72+7*9+6] + bc2.w * kernelsL[2*72+7*9+7] + br2.w * kernelsL[2*72+7*9+8] + biasL[2]
        ,
        tl1.x * kernelsL[3*72+0*9+0] + tc1.x * kernelsL[3*72+0*9+1] + tr1.x * kernelsL[3*72+0*9+2] +
        ml1.x * kernelsL[3*72+0*9+3] + mc1.x * kernelsL[3*72+0*9+4] + mr1.x * kernelsL[3*72+0*9+5] +
        bl1.x * kernelsL[3*72+0*9+6] + bc1.x * kernelsL[3*72+0*9+7] + br1.x * kernelsL[3*72+0*9+8] + 

        tl1.y * kernelsL[3*72+1*9+0] + tc1.y * kernelsL[3*72+1*9+1] + tr1.y * kernelsL[3*72+1*9+2] +
        ml1.y * kernelsL[3*72+1*9+3] + mc1.y * kernelsL[3*72+1*9+4] + mr1.y * kernelsL[3*72+1*9+5] +
        bl1.y * kernelsL[3*72+1*9+6] + bc1.y * kernelsL[3*72+1*9+7] + br1.y * kernelsL[3*72+1*9+8] + 

        tl1.z * kernelsL[3*72+2*9+0] + tc1.z * kernelsL[3*72+2*9+1] + tr1.z * kernelsL[3*72+2*9+2] +
        ml1.z * kernelsL[3*72+2*9+3] + mc1.z * kernelsL[3*72+2*9+4] + mr1.z * kernelsL[3*72+2*9+5] +
        bl1.z * kernelsL[3*72+2*9+6] + bc1.z * kernelsL[3*72+2*9+7] + br1.z * kernelsL[3*72+2*9+8] + 

        tl1.w * kernelsL[3*72+3*9+0] + tc1.w * kernelsL[3*72+3*9+1] + tr1.w * kernelsL[3*72+3*9+2] +
        ml1.w * kernelsL[3*72+3*9+3] + mc1.w * kernelsL[3*72+3*9+4] + mr1.w * kernelsL[3*72+3*9+5] +
        bl1.w * kernelsL[3*72+3*9+6] + bc1.w * kernelsL[3*72+3*9+7] + br1.w * kernelsL[3*72+3*9+8] +

        tl2.x * kernelsL[3*72+4*9+0] + tc2.x * kernelsL[3*72+4*9+1] + tr2.x * kernelsL[3*72+4*9+2] +
        ml2.x * kernelsL[3*72+4*9+3] + mc2.x * kernelsL[3*72+4*9+4] + mr2.x * kernelsL[3*72+4*9+5] +
        bl2.x * kernelsL[3*72+4*9+6] + bc2.x * kernelsL[3*72+4*9+7] + br2.x * kernelsL[3*72+4*9+8] + 

        tl2.y * kernelsL[3*72+5*9+0] + tc2.y * kernelsL[3*72+5*9+1] + tr2.y * kernelsL[3*72+5*9+2] +
        ml2.y * kernelsL[3*72+5*9+3] + mc2.y * kernelsL[3*72+5*9+4] + mr2.y * kernelsL[3*72+5*9+5] +
        bl2.y * kernelsL[3*72+5*9+6] + bc2.y * kernelsL[3*72+5*9+7] + br2.y * kernelsL[3*72+5*9+8] + 

        tl2.z * kernelsL[3*72+6*9+0] + tc2.z * kernelsL[3*72+6*9+1] + tr2.z * kernelsL[3*72+6*9+2] +
        ml2.z * kernelsL[3*72+6*9+3] + mc2.z * kernelsL[3*72+6*9+4] + mr2.z * kernelsL[3*72+6*9+5] +
        bl2.z * kernelsL[3*72+6*9+6] + bc2.z * kernelsL[3*72+6*9+7] + br2.z * kernelsL[3*72+6*9+8] + 

        tl2.w * kernelsL[3*72+7*9+0] + tc2.w * kernelsL[3*72+7*9+1] + tr2.w * kernelsL[3*72+7*9+2] +
        ml2.w * kernelsL[3*72+7*9+3] + mc2.w * kernelsL[3*72+7*9+4] + mr2.w * kernelsL[3*72+7*9+5] +
        bl2.w * kernelsL[3*72+7*9+6] + bc2.w * kernelsL[3*72+7*9+7] + br2.w * kernelsL[3*72+7*9+8] + biasL[3]
    ));


    return c5678;
}

//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L3
//!BIND L2_1
//!BIND L2_2
//!SAVE L1_1
//!COMPONENTS 4

#define RELU(x) max(x, vec4(0.0f))

const float kernelsL[9 * 8 * 4] = float[9 * 8 * 4]
(
-2.4230e-40,  5.4425e-39,  3.4517e-39,
-1.9803e-39, -1.5207e-39, -3.5630e-39,
-4.9409e-39, -2.9280e-39,  7.7966e-40,
 2.4867e-39, -2.1848e-39,  3.2524e-39,
-6.2860e-39,  4.0411e-39, -3.6956e-39,
-3.3384e-39, -1.0908e-39,  5.4261e-39,
-3.6691e-40,  9.4949e-40, -1.7279e-39,
-1.0644e-39, -2.1371e-39, -2.5125e-39,
 2.9368e-39, -5.3820e-39, -3.9771e-40,
-1.4703e-39, -3.6960e-39, -4.4161e-39,
 8.2800e-40, -4.9175e-39,  3.1868e-39,
 5.5703e-39, -3.0263e-39, -1.6991e-39,
 5.2691e-39,  4.8127e-39,  4.1346e-39,
-1.3013e-39, -1.7101e-39, -3.5467e-39,
 1.1496e-39,  2.0938e-39, -4.2970e-39,
-5.5314e-39,  6.4852e-40, -5.0870e-39,
 3.9377e-39, -4.1683e-39, -3.5404e-40,
-3.6188e-39,  5.4657e-39,  2.1279e-39,
 3.4090e-40,  2.4425e-40,  9.3423e-41,
-2.3450e-39,  3.1518e-40,  4.3061e-40,
-2.6175e-39, -2.4696e-39, -2.3755e-39,
 2.2764e-39, -4.4934e-39,  8.5722e-40,
 5.1798e-39,  2.7072e-39,  5.3750e-39,
 5.4335e-40,  3.8556e-39, -3.4799e-39,
-4.8963e-39, -1.1413e-39, -5.3918e-40,
 6.1843e-39, -1.8521e-39, -1.3450e-39,
-2.0906e-39, -3.2544e-39, -2.8205e-39,
 5.3550e-39, -3.0202e-39, -3.4181e-39,
-3.0043e-39, -3.2900e-39, -3.2915e-39,
 6.1849e-39, -3.3421e-39, -3.3995e-39,
-4.8657e-39, -4.7034e-39, -4.7467e-39,
-4.6555e-39, -4.6045e-39, -4.6954e-39,
-4.8886e-39, -4.7333e-39, -4.7805e-39,
-2.0900e-39, -1.9429e-39, -2.0572e-39,
-2.0270e-39, -1.9074e-39, -1.9275e-39,
-2.1243e-39, -2.1134e-39, -2.1539e-39,
-4.4175e-39, -4.6412e-39, -4.6582e-39,
-4.6364e-39, -4.8757e-39, -4.6795e-39,
-4.4571e-39, -4.5038e-39, -4.4570e-39,
-3.2662e-39, -3.1163e-39, -3.2050e-39,
-3.2098e-39, -3.0887e-39, -3.1635e-39,
-3.3183e-39, -3.1411e-39, -3.2824e-39,
 8.6839e-40,  5.7318e-39,  1.8373e-40,
 4.6732e-39, -4.5549e-41,  1.2817e-39,
 3.7642e-41, -6.2591e-39, -5.0492e-39,
 5.0057e-39,  6.0612e-39,  2.0220e-39,
 3.7436e-39,  4.8326e-39,  3.1353e-39,
 3.5289e-39,  4.7177e-39,  6.2666e-39,
-1.4963e-01, -8.0360e-02, -7.9054e-02,
-1.3731e-01,  5.0766e-02,  6.9673e-02,
 3.2213e-02,  3.3250e-02,  1.3170e-01,
-2.9718e-02, -2.6931e-02,  1.5768e-02,
 5.9232e-02,  7.8471e-02,  9.9465e-02,
 2.4872e-02, -4.4226e-02,  3.2357e-02,
-6.0139e-02, -2.2756e-02, -5.5412e-02,
 4.5363e-02,  1.6393e-01,  3.7428e-02,
 5.2497e-02,  9.5435e-02,  9.7155e-02,
 8.2849e-02,  5.9711e-02,  1.4352e-01,
 1.1756e-02,  1.5440e-02,  1.3039e-01,
 4.3324e-03,  5.9119e-02,  1.1129e-01,
-3.9591e-03,  5.8617e-02, -1.3843e-02,
-2.9949e-02,  3.4877e-02,  5.0679e-03,
 3.7278e-02, -2.5221e-02,  1.2191e-01,
 1.5626e-01,  8.9797e-02, -1.5458e-02,
 1.5607e-01,  1.4561e-02,  1.1720e-01,
-1.6112e-02,  7.7908e-02, -6.1322e-02,
 3.8589e-39,  3.9262e-39,  3.8641e-39,
 3.9450e-39,  3.8805e-39,  3.9383e-39,
 3.8384e-39,  3.8027e-39,  3.7700e-39,
 6.2294e-02, -5.6804e-03, -4.7293e-01,
 1.3161e-01,  3.1187e-01, -1.8013e-01,
 4.9908e-02,  9.8583e-02,  3.8863e-02,
-1.7400e-39,  3.5779e-39,  5.2800e-39,
-1.6845e-39,  4.7140e-39,  2.4244e-39,
-1.3654e-39,  2.4123e-40, -1.5360e-39,
-1.0409e-39,  1.8590e-39, -5.2161e-41,
-8.5110e-40, -1.7210e-39, -4.6624e-39,
 5.0754e-40, -2.6248e-39, -5.4801e-39,
-4.9486e-39,  2.8984e-39,  4.9357e-39,
-1.4077e-39,  3.8778e-39,  5.8202e-39,
-4.1095e-39,  6.8891e-40,  5.6565e-39,
 3.8021e-39, -5.4740e-41,  2.1795e-39,
-2.4185e-39, -5.8101e-39,  1.5651e-39,
-4.9775e-39,  6.0152e-39, -5.2337e-39,
-4.4350e-39, -3.8239e-39,  3.1624e-40,
-4.3665e-39, -3.0919e-39, -4.7675e-39,
-2.3335e-39,  1.8270e-39, -5.5077e-39,
 5.5906e-39,  6.7732e-41,  3.7359e-39,
-5.1412e-40, -2.3239e-39,  5.1937e-39,
-4.4951e-39, -3.4928e-40, -5.0589e-39,
 4.9149e-39,  1.1372e-39,  6.6368e-40,
-1.8870e-40, -5.9117e-40, -1.3973e-39,
-2.3555e-39, -1.0637e-39,  3.1692e-39,
-4.8054e-39,  4.8090e-40,  2.0873e-39,
 3.8301e-39, -3.8642e-39,  4.8187e-39,
-1.6563e-39,  8.9890e-40, -3.5162e-39
);

const float biasL[4] = float[4]
(
-4.9844e-39, -1.8567e-39,  6.0627e-04, -1.9234e-38
);

vec4 hook()
{
    vec4 tl1 = L2_1_texOff(vec2(-1,-1));
    vec4 tc1 = L2_1_texOff(vec2(0,-1));
    vec4 tr1 = L2_1_texOff(vec2(1,-1));
    vec4 ml1 = L2_1_texOff(vec2(-1,0));
    vec4 mc1 = L2_1_texOff(vec2(0,0));
    vec4 mr1 = L2_1_texOff(vec2(1,0));
    vec4 bl1 = L2_1_texOff(vec2(-1,1));
    vec4 bc1 = L2_1_texOff(vec2(0,1));
    vec4 br1 = L2_1_texOff(vec2(1,1));

    vec4 tl2 = L2_2_texOff(vec2(-1,-1));
    vec4 tc2 = L2_2_texOff(vec2(0,-1));
    vec4 tr2 = L2_2_texOff(vec2(1,-1));
    vec4 ml2 = L2_2_texOff(vec2(-1,0));
    vec4 mc2 = L2_2_texOff(vec2(0,0));
    vec4 mr2 = L2_2_texOff(vec2(1,0));
    vec4 bl2 = L2_2_texOff(vec2(-1,1));
    vec4 bc2 = L2_2_texOff(vec2(0,1));
    vec4 br2 = L2_2_texOff(vec2(1,1));

    vec4 c1234 = RELU(vec4(
        tl1.x * kernelsL[0*72+0*9+0] + tc1.x * kernelsL[0*72+0*9+1] + tr1.x * kernelsL[0*72+0*9+2] +
        ml1.x * kernelsL[0*72+0*9+3] + mc1.x * kernelsL[0*72+0*9+4] + mr1.x * kernelsL[0*72+0*9+5] +
        bl1.x * kernelsL[0*72+0*9+6] + bc1.x * kernelsL[0*72+0*9+7] + br1.x * kernelsL[0*72+0*9+8] + 

        tl1.y * kernelsL[0*72+1*9+0] + tc1.y * kernelsL[0*72+1*9+1] + tr1.y * kernelsL[0*72+1*9+2] +
        ml1.y * kernelsL[0*72+1*9+3] + mc1.y * kernelsL[0*72+1*9+4] + mr1.y * kernelsL[0*72+1*9+5] +
        bl1.y * kernelsL[0*72+1*9+6] + bc1.y * kernelsL[0*72+1*9+7] + br1.y * kernelsL[0*72+1*9+8] + 

        tl1.z * kernelsL[0*72+2*9+0] + tc1.z * kernelsL[0*72+2*9+1] + tr1.z * kernelsL[0*72+2*9+2] +
        ml1.z * kernelsL[0*72+2*9+3] + mc1.z * kernelsL[0*72+2*9+4] + mr1.z * kernelsL[0*72+2*9+5] +
        bl1.z * kernelsL[0*72+2*9+6] + bc1.z * kernelsL[0*72+2*9+7] + br1.z * kernelsL[0*72+2*9+8] + 

        tl1.w * kernelsL[0*72+3*9+0] + tc1.w * kernelsL[0*72+3*9+1] + tr1.w * kernelsL[0*72+3*9+2] +
        ml1.w * kernelsL[0*72+3*9+3] + mc1.w * kernelsL[0*72+3*9+4] + mr1.w * kernelsL[0*72+3*9+5] +
        bl1.w * kernelsL[0*72+3*9+6] + bc1.w * kernelsL[0*72+3*9+7] + br1.w * kernelsL[0*72+3*9+8] +

        tl2.x * kernelsL[0*72+4*9+0] + tc2.x * kernelsL[0*72+4*9+1] + tr2.x * kernelsL[0*72+4*9+2] +
        ml2.x * kernelsL[0*72+4*9+3] + mc2.x * kernelsL[0*72+4*9+4] + mr2.x * kernelsL[0*72+4*9+5] +
        bl2.x * kernelsL[0*72+4*9+6] + bc2.x * kernelsL[0*72+4*9+7] + br2.x * kernelsL[0*72+4*9+8] + 

        tl2.y * kernelsL[0*72+5*9+0] + tc2.y * kernelsL[0*72+5*9+1] + tr2.y * kernelsL[0*72+5*9+2] +
        ml2.y * kernelsL[0*72+5*9+3] + mc2.y * kernelsL[0*72+5*9+4] + mr2.y * kernelsL[0*72+5*9+5] +
        bl2.y * kernelsL[0*72+5*9+6] + bc2.y * kernelsL[0*72+5*9+7] + br2.y * kernelsL[0*72+5*9+8] + 

        tl2.z * kernelsL[0*72+6*9+0] + tc2.z * kernelsL[0*72+6*9+1] + tr2.z * kernelsL[0*72+6*9+2] +
        ml2.z * kernelsL[0*72+6*9+3] + mc2.z * kernelsL[0*72+6*9+4] + mr2.z * kernelsL[0*72+6*9+5] +
        bl2.z * kernelsL[0*72+6*9+6] + bc2.z * kernelsL[0*72+6*9+7] + br2.z * kernelsL[0*72+6*9+8] + 

        tl2.w * kernelsL[0*72+7*9+0] + tc2.w * kernelsL[0*72+7*9+1] + tr2.w * kernelsL[0*72+7*9+2] +
        ml2.w * kernelsL[0*72+7*9+3] + mc2.w * kernelsL[0*72+7*9+4] + mr2.w * kernelsL[0*72+7*9+5] +
        bl2.w * kernelsL[0*72+7*9+6] + bc2.w * kernelsL[0*72+7*9+7] + br2.w * kernelsL[0*72+7*9+8] + biasL[0]
        ,
        tl1.x * kernelsL[1*72+0*9+0] + tc1.x * kernelsL[1*72+0*9+1] + tr1.x * kernelsL[1*72+0*9+2] +
        ml1.x * kernelsL[1*72+0*9+3] + mc1.x * kernelsL[1*72+0*9+4] + mr1.x * kernelsL[1*72+0*9+5] +
        bl1.x * kernelsL[1*72+0*9+6] + bc1.x * kernelsL[1*72+0*9+7] + br1.x * kernelsL[1*72+0*9+8] + 

        tl1.y * kernelsL[1*72+1*9+0] + tc1.y * kernelsL[1*72+1*9+1] + tr1.y * kernelsL[1*72+1*9+2] +
        ml1.y * kernelsL[1*72+1*9+3] + mc1.y * kernelsL[1*72+1*9+4] + mr1.y * kernelsL[1*72+1*9+5] +
        bl1.y * kernelsL[1*72+1*9+6] + bc1.y * kernelsL[1*72+1*9+7] + br1.y * kernelsL[1*72+1*9+8] + 

        tl1.z * kernelsL[1*72+2*9+0] + tc1.z * kernelsL[1*72+2*9+1] + tr1.z * kernelsL[1*72+2*9+2] +
        ml1.z * kernelsL[1*72+2*9+3] + mc1.z * kernelsL[1*72+2*9+4] + mr1.z * kernelsL[1*72+2*9+5] +
        bl1.z * kernelsL[1*72+2*9+6] + bc1.z * kernelsL[1*72+2*9+7] + br1.z * kernelsL[1*72+2*9+8] + 

        tl1.w * kernelsL[1*72+3*9+0] + tc1.w * kernelsL[1*72+3*9+1] + tr1.w * kernelsL[1*72+3*9+2] +
        ml1.w * kernelsL[1*72+3*9+3] + mc1.w * kernelsL[1*72+3*9+4] + mr1.w * kernelsL[1*72+3*9+5] +
        bl1.w * kernelsL[1*72+3*9+6] + bc1.w * kernelsL[1*72+3*9+7] + br1.w * kernelsL[1*72+3*9+8] +

        tl2.x * kernelsL[1*72+4*9+0] + tc2.x * kernelsL[1*72+4*9+1] + tr2.x * kernelsL[1*72+4*9+2] +
        ml2.x * kernelsL[1*72+4*9+3] + mc2.x * kernelsL[1*72+4*9+4] + mr2.x * kernelsL[1*72+4*9+5] +
        bl2.x * kernelsL[1*72+4*9+6] + bc2.x * kernelsL[1*72+4*9+7] + br2.x * kernelsL[1*72+4*9+8] + 

        tl2.y * kernelsL[1*72+5*9+0] + tc2.y * kernelsL[1*72+5*9+1] + tr2.y * kernelsL[1*72+5*9+2] +
        ml2.y * kernelsL[1*72+5*9+3] + mc2.y * kernelsL[1*72+5*9+4] + mr2.y * kernelsL[1*72+5*9+5] +
        bl2.y * kernelsL[1*72+5*9+6] + bc2.y * kernelsL[1*72+5*9+7] + br2.y * kernelsL[1*72+5*9+8] + 

        tl2.z * kernelsL[1*72+6*9+0] + tc2.z * kernelsL[1*72+6*9+1] + tr2.z * kernelsL[1*72+6*9+2] +
        ml2.z * kernelsL[1*72+6*9+3] + mc2.z * kernelsL[1*72+6*9+4] + mr2.z * kernelsL[1*72+6*9+5] +
        bl2.z * kernelsL[1*72+6*9+6] + bc2.z * kernelsL[1*72+6*9+7] + br2.z * kernelsL[1*72+6*9+8] + 

        tl2.w * kernelsL[1*72+7*9+0] + tc2.w * kernelsL[1*72+7*9+1] + tr2.w * kernelsL[1*72+7*9+2] +
        ml2.w * kernelsL[1*72+7*9+3] + mc2.w * kernelsL[1*72+7*9+4] + mr2.w * kernelsL[1*72+7*9+5] +
        bl2.w * kernelsL[1*72+7*9+6] + bc2.w * kernelsL[1*72+7*9+7] + br2.w * kernelsL[1*72+7*9+8] + biasL[1]
        ,
        tl1.x * kernelsL[2*72+0*9+0] + tc1.x * kernelsL[2*72+0*9+1] + tr1.x * kernelsL[2*72+0*9+2] +
        ml1.x * kernelsL[2*72+0*9+3] + mc1.x * kernelsL[2*72+0*9+4] + mr1.x * kernelsL[2*72+0*9+5] +
        bl1.x * kernelsL[2*72+0*9+6] + bc1.x * kernelsL[2*72+0*9+7] + br1.x * kernelsL[2*72+0*9+8] + 

        tl1.y * kernelsL[2*72+1*9+0] + tc1.y * kernelsL[2*72+1*9+1] + tr1.y * kernelsL[2*72+1*9+2] +
        ml1.y * kernelsL[2*72+1*9+3] + mc1.y * kernelsL[2*72+1*9+4] + mr1.y * kernelsL[2*72+1*9+5] +
        bl1.y * kernelsL[2*72+1*9+6] + bc1.y * kernelsL[2*72+1*9+7] + br1.y * kernelsL[2*72+1*9+8] + 

        tl1.z * kernelsL[2*72+2*9+0] + tc1.z * kernelsL[2*72+2*9+1] + tr1.z * kernelsL[2*72+2*9+2] +
        ml1.z * kernelsL[2*72+2*9+3] + mc1.z * kernelsL[2*72+2*9+4] + mr1.z * kernelsL[2*72+2*9+5] +
        bl1.z * kernelsL[2*72+2*9+6] + bc1.z * kernelsL[2*72+2*9+7] + br1.z * kernelsL[2*72+2*9+8] + 

        tl1.w * kernelsL[2*72+3*9+0] + tc1.w * kernelsL[2*72+3*9+1] + tr1.w * kernelsL[2*72+3*9+2] +
        ml1.w * kernelsL[2*72+3*9+3] + mc1.w * kernelsL[2*72+3*9+4] + mr1.w * kernelsL[2*72+3*9+5] +
        bl1.w * kernelsL[2*72+3*9+6] + bc1.w * kernelsL[2*72+3*9+7] + br1.w * kernelsL[2*72+3*9+8] +

        tl2.x * kernelsL[2*72+4*9+0] + tc2.x * kernelsL[2*72+4*9+1] + tr2.x * kernelsL[2*72+4*9+2] +
        ml2.x * kernelsL[2*72+4*9+3] + mc2.x * kernelsL[2*72+4*9+4] + mr2.x * kernelsL[2*72+4*9+5] +
        bl2.x * kernelsL[2*72+4*9+6] + bc2.x * kernelsL[2*72+4*9+7] + br2.x * kernelsL[2*72+4*9+8] + 

        tl2.y * kernelsL[2*72+5*9+0] + tc2.y * kernelsL[2*72+5*9+1] + tr2.y * kernelsL[2*72+5*9+2] +
        ml2.y * kernelsL[2*72+5*9+3] + mc2.y * kernelsL[2*72+5*9+4] + mr2.y * kernelsL[2*72+5*9+5] +
        bl2.y * kernelsL[2*72+5*9+6] + bc2.y * kernelsL[2*72+5*9+7] + br2.y * kernelsL[2*72+5*9+8] + 

        tl2.z * kernelsL[2*72+6*9+0] + tc2.z * kernelsL[2*72+6*9+1] + tr2.z * kernelsL[2*72+6*9+2] +
        ml2.z * kernelsL[2*72+6*9+3] + mc2.z * kernelsL[2*72+6*9+4] + mr2.z * kernelsL[2*72+6*9+5] +
        bl2.z * kernelsL[2*72+6*9+6] + bc2.z * kernelsL[2*72+6*9+7] + br2.z * kernelsL[2*72+6*9+8] + 

        tl2.w * kernelsL[2*72+7*9+0] + tc2.w * kernelsL[2*72+7*9+1] + tr2.w * kernelsL[2*72+7*9+2] +
        ml2.w * kernelsL[2*72+7*9+3] + mc2.w * kernelsL[2*72+7*9+4] + mr2.w * kernelsL[2*72+7*9+5] +
        bl2.w * kernelsL[2*72+7*9+6] + bc2.w * kernelsL[2*72+7*9+7] + br2.w * kernelsL[2*72+7*9+8] + biasL[2]
        ,
        tl1.x * kernelsL[3*72+0*9+0] + tc1.x * kernelsL[3*72+0*9+1] + tr1.x * kernelsL[3*72+0*9+2] +
        ml1.x * kernelsL[3*72+0*9+3] + mc1.x * kernelsL[3*72+0*9+4] + mr1.x * kernelsL[3*72+0*9+5] +
        bl1.x * kernelsL[3*72+0*9+6] + bc1.x * kernelsL[3*72+0*9+7] + br1.x * kernelsL[3*72+0*9+8] + 

        tl1.y * kernelsL[3*72+1*9+0] + tc1.y * kernelsL[3*72+1*9+1] + tr1.y * kernelsL[3*72+1*9+2] +
        ml1.y * kernelsL[3*72+1*9+3] + mc1.y * kernelsL[3*72+1*9+4] + mr1.y * kernelsL[3*72+1*9+5] +
        bl1.y * kernelsL[3*72+1*9+6] + bc1.y * kernelsL[3*72+1*9+7] + br1.y * kernelsL[3*72+1*9+8] + 

        tl1.z * kernelsL[3*72+2*9+0] + tc1.z * kernelsL[3*72+2*9+1] + tr1.z * kernelsL[3*72+2*9+2] +
        ml1.z * kernelsL[3*72+2*9+3] + mc1.z * kernelsL[3*72+2*9+4] + mr1.z * kernelsL[3*72+2*9+5] +
        bl1.z * kernelsL[3*72+2*9+6] + bc1.z * kernelsL[3*72+2*9+7] + br1.z * kernelsL[3*72+2*9+8] + 

        tl1.w * kernelsL[3*72+3*9+0] + tc1.w * kernelsL[3*72+3*9+1] + tr1.w * kernelsL[3*72+3*9+2] +
        ml1.w * kernelsL[3*72+3*9+3] + mc1.w * kernelsL[3*72+3*9+4] + mr1.w * kernelsL[3*72+3*9+5] +
        bl1.w * kernelsL[3*72+3*9+6] + bc1.w * kernelsL[3*72+3*9+7] + br1.w * kernelsL[3*72+3*9+8] +

        tl2.x * kernelsL[3*72+4*9+0] + tc2.x * kernelsL[3*72+4*9+1] + tr2.x * kernelsL[3*72+4*9+2] +
        ml2.x * kernelsL[3*72+4*9+3] + mc2.x * kernelsL[3*72+4*9+4] + mr2.x * kernelsL[3*72+4*9+5] +
        bl2.x * kernelsL[3*72+4*9+6] + bc2.x * kernelsL[3*72+4*9+7] + br2.x * kernelsL[3*72+4*9+8] + 

        tl2.y * kernelsL[3*72+5*9+0] + tc2.y * kernelsL[3*72+5*9+1] + tr2.y * kernelsL[3*72+5*9+2] +
        ml2.y * kernelsL[3*72+5*9+3] + mc2.y * kernelsL[3*72+5*9+4] + mr2.y * kernelsL[3*72+5*9+5] +
        bl2.y * kernelsL[3*72+5*9+6] + bc2.y * kernelsL[3*72+5*9+7] + br2.y * kernelsL[3*72+5*9+8] + 

        tl2.z * kernelsL[3*72+6*9+0] + tc2.z * kernelsL[3*72+6*9+1] + tr2.z * kernelsL[3*72+6*9+2] +
        ml2.z * kernelsL[3*72+6*9+3] + mc2.z * kernelsL[3*72+6*9+4] + mr2.z * kernelsL[3*72+6*9+5] +
        bl2.z * kernelsL[3*72+6*9+6] + bc2.z * kernelsL[3*72+6*9+7] + br2.z * kernelsL[3*72+6*9+8] + 

        tl2.w * kernelsL[3*72+7*9+0] + tc2.w * kernelsL[3*72+7*9+1] + tr2.w * kernelsL[3*72+7*9+2] +
        ml2.w * kernelsL[3*72+7*9+3] + mc2.w * kernelsL[3*72+7*9+4] + mr2.w * kernelsL[3*72+7*9+5] +
        bl2.w * kernelsL[3*72+7*9+6] + bc2.w * kernelsL[3*72+7*9+7] + br2.w * kernelsL[3*72+7*9+8] + biasL[3]
    ));


    return c1234;
}


//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L3
//!BIND L2_1
//!BIND L2_2
//!SAVE L1_2
//!COMPONENTS 4

#define RELU(x) max(x, vec4(0.0f))

const float kernelsL[9 * 8 * 4] = float[9 * 8 * 4]
(
-2.3010e-01, -7.4445e-02, -1.0006e-01,
-2.4543e-01, -8.5750e-02,  1.4859e-01,
-1.3783e-01,  1.2709e-01,  2.5012e-01,
 1.0310e-01, -2.3520e-02, -8.1277e-02,
-2.9267e-02,  1.0686e-01,  4.6287e-02,
-1.2342e-02, -1.7104e-02,  8.4357e-02,
-1.8492e-02, -2.0711e-02, -3.5242e-02,
 7.6163e-02,  6.0853e-02,  9.4248e-02,
 6.2008e-02,  1.1373e-02,  2.6609e-02,
-7.8135e-02,  1.0672e-01, -5.8380e-02,
 7.1618e-02,  2.7966e-04,  1.1835e-01,
 1.1306e-01, -7.8578e-03,  5.1743e-03,
-1.2123e-01,  4.9640e-02,  7.3827e-02,
-1.0377e-01, -3.7377e-02, -3.6536e-02,
 5.7489e-02, -4.6279e-04,  9.0068e-02,
 4.0784e-05, -3.3328e-02,  5.1191e-02,
 9.6538e-02,  7.1779e-02,  1.2121e-01,
 1.1598e-01, -5.9055e-02,  8.2671e-02,
-1.7292e-39, -1.7848e-39, -1.7308e-39,
-3.2817e-39, -1.7274e-39, -3.3601e-39,
-1.7252e-39, -3.4067e-39, -1.7783e-39,
-7.4053e-02, -4.2785e-01, -4.7597e-01,
 4.6309e-01,  7.6018e-02, -3.5885e-01,
 3.0428e-01,  8.7449e-02,  9.7880e-02,
-3.4191e-02,  1.1834e-01, -4.3273e-02,
-6.0782e-01,  9.2387e-01, -1.3972e-01,
 3.0665e-01,  4.7445e-01,  4.8683e-02,
-1.8865e-02,  9.9509e-02, -4.9881e-02,
 2.1640e-02, -2.0941e-01, -1.4779e-01,
 1.7808e-01, -1.2572e-01, -9.6756e-02,
-1.0143e-01,  8.3153e-02, -1.0478e-01,
 1.6201e-01,  2.0740e-01, -1.2653e-01,
 8.1654e-02, -7.6224e-02, -8.9864e-02,
 4.5383e-02, -3.6893e-02, -1.0096e-01,
 2.0389e-01,  2.2557e-01, -1.9685e-01,
-9.5198e-02,  2.2877e-01,  2.1135e-02,
-1.0919e-01, -1.7563e-01, -3.5255e-01,
-1.3447e-01,  3.3709e-01, -1.9043e-01,
-2.1422e-01, -2.8848e-01, -5.3921e-02,
 5.5351e-02, -5.0579e-02, -1.6168e-01,
 2.5282e-01,  1.9715e-01, -2.4035e-01,
-3.0800e-02,  1.9329e-01, -1.0893e-01,
-3.4416e-39, -1.8080e-39, -1.6625e-39,
-1.6612e-39, -1.7397e-39, -1.5953e-39,
 5.3047e-39,  5.4221e-39, -1.1665e-39,
 2.1838e-02, -7.0635e-02,  3.6095e-01,
 5.1096e-01,  6.3838e-01,  5.0716e-01,
 1.1642e-01,  1.8546e-01,  1.5989e-01,
 1.0799e-01,  2.8380e-01,  1.4910e-01,
-2.4305e-01,  2.3084e-01, -9.9982e-02,
-4.6839e-01,  6.0376e-01, -1.2748e-02,
 8.7608e-02,  9.8828e-02,  2.1469e-02,
-3.5384e-03, -1.5689e-01, -1.1411e-01,
 2.0728e-02,  5.6814e-02, -1.1090e-02,
-3.9301e-02, -9.4325e-02, -6.2119e-02,
 1.2842e-01,  9.7466e-02, -2.7502e-02,
 1.6560e-01,  1.5058e-01,  2.2821e-02,
-8.1287e-02, -6.3940e-03,  3.2162e-02,
 9.4116e-02, -6.2567e-02, -1.2704e-01,
 5.4654e-02,  1.4885e-02,  3.8166e-03,
 1.9830e-01, -2.5419e-01, -6.7067e-02,
 3.2303e-01,  1.6037e-01, -3.0200e-02,
 1.3011e-01,  7.5455e-02, -1.2726e-02,
-1.9198e-01, -1.5419e-01, -7.5420e-02,
 1.6070e-01, -6.1031e-02, -2.0179e-01,
-1.5829e-02,  1.9918e-01,  1.0960e-01,
-5.5215e-39, -5.8659e-39, -5.5573e-39,
-6.2394e-39, -6.0172e-39, -6.0159e-39,
-4.0308e-39, -4.1217e-39, -4.1372e-39,
 1.6143e-01,  1.7271e-01,  4.3534e-01,
-2.4312e-01,  4.0146e-01,  4.4693e-01,
 1.5442e-01,  3.9885e-01, -1.4357e-01,
-6.0236e-02, -1.2324e-01,  6.1197e-02,
-2.5842e-02, -1.0266e-02,  1.5670e-03,
 2.9103e-02,  2.9966e-02,  1.1286e-01,
 3.4528e-02,  1.3039e-01,  9.2736e-02,
 3.5193e-02,  5.6583e-02,  5.9465e-02,
 1.2846e-01,  9.3387e-02,  9.2131e-02,
 1.4974e-03,  1.0196e-01,  6.7632e-02,
 8.9809e-02,  5.7568e-02, -6.0621e-02,
-2.7582e-03,  3.1935e-02,  3.1299e-02,
 1.3595e-01,  4.9498e-02,  1.2535e-01,
-3.9396e-02,  4.8859e-02,  4.1389e-02,
 3.7026e-02,  1.3667e-01,  7.5657e-03,
-5.3476e-02,  1.9677e-02,  9.5214e-02,
 1.3136e-02,  7.5560e-02,  6.2428e-03,
-5.2378e-02, -1.8704e-02,  1.0657e-01,
-4.2938e-02, -5.0199e-02,  1.4357e-01,
-5.7002e-02,  1.4158e-01,  4.9442e-02,
-6.8383e-02,  1.1316e-01,  5.2071e-02,
 1.5031e-40,  2.1250e-40,  1.8673e-40,
 1.5681e-40,  1.3104e-40,  1.6173e-40,
 2.1560e-40,  1.8582e-40,  1.7747e-40,
 8.4848e-02, -1.9845e-01, -5.1844e-01,
 3.0959e-01,  3.6682e-01,  3.1208e-02,
 1.9871e-01,  2.8318e-01,  1.6066e-01
);

const float biasL[4] = float[4]
(
 1.8331e-02, -1.1364e-01, -8.3962e-03, -1.7372e-04
);

vec4 hook()
{
    vec4 tl1 = L2_1_texOff(vec2(-1,-1));
    vec4 tc1 = L2_1_texOff(vec2(0,-1));
    vec4 tr1 = L2_1_texOff(vec2(1,-1));
    vec4 ml1 = L2_1_texOff(vec2(-1,0));
    vec4 mc1 = L2_1_texOff(vec2(0,0));
    vec4 mr1 = L2_1_texOff(vec2(1,0));
    vec4 bl1 = L2_1_texOff(vec2(-1,1));
    vec4 bc1 = L2_1_texOff(vec2(0,1));
    vec4 br1 = L2_1_texOff(vec2(1,1));

    vec4 tl2 = L2_2_texOff(vec2(-1,-1));
    vec4 tc2 = L2_2_texOff(vec2(0,-1));
    vec4 tr2 = L2_2_texOff(vec2(1,-1));
    vec4 ml2 = L2_2_texOff(vec2(-1,0));
    vec4 mc2 = L2_2_texOff(vec2(0,0));
    vec4 mr2 = L2_2_texOff(vec2(1,0));
    vec4 bl2 = L2_2_texOff(vec2(-1,1));
    vec4 bc2 = L2_2_texOff(vec2(0,1));
    vec4 br2 = L2_2_texOff(vec2(1,1));

    vec4 c5678 = RELU(vec4(
        tl1.x * kernelsL[0*72+0*9+0] + tc1.x * kernelsL[0*72+0*9+1] + tr1.x * kernelsL[0*72+0*9+2] +
        ml1.x * kernelsL[0*72+0*9+3] + mc1.x * kernelsL[0*72+0*9+4] + mr1.x * kernelsL[0*72+0*9+5] +
        bl1.x * kernelsL[0*72+0*9+6] + bc1.x * kernelsL[0*72+0*9+7] + br1.x * kernelsL[0*72+0*9+8] + 

        tl1.y * kernelsL[0*72+1*9+0] + tc1.y * kernelsL[0*72+1*9+1] + tr1.y * kernelsL[0*72+1*9+2] +
        ml1.y * kernelsL[0*72+1*9+3] + mc1.y * kernelsL[0*72+1*9+4] + mr1.y * kernelsL[0*72+1*9+5] +
        bl1.y * kernelsL[0*72+1*9+6] + bc1.y * kernelsL[0*72+1*9+7] + br1.y * kernelsL[0*72+1*9+8] + 

        tl1.z * kernelsL[0*72+2*9+0] + tc1.z * kernelsL[0*72+2*9+1] + tr1.z * kernelsL[0*72+2*9+2] +
        ml1.z * kernelsL[0*72+2*9+3] + mc1.z * kernelsL[0*72+2*9+4] + mr1.z * kernelsL[0*72+2*9+5] +
        bl1.z * kernelsL[0*72+2*9+6] + bc1.z * kernelsL[0*72+2*9+7] + br1.z * kernelsL[0*72+2*9+8] + 

        tl1.w * kernelsL[0*72+3*9+0] + tc1.w * kernelsL[0*72+3*9+1] + tr1.w * kernelsL[0*72+3*9+2] +
        ml1.w * kernelsL[0*72+3*9+3] + mc1.w * kernelsL[0*72+3*9+4] + mr1.w * kernelsL[0*72+3*9+5] +
        bl1.w * kernelsL[0*72+3*9+6] + bc1.w * kernelsL[0*72+3*9+7] + br1.w * kernelsL[0*72+3*9+8] +

        tl2.x * kernelsL[0*72+4*9+0] + tc2.x * kernelsL[0*72+4*9+1] + tr2.x * kernelsL[0*72+4*9+2] +
        ml2.x * kernelsL[0*72+4*9+3] + mc2.x * kernelsL[0*72+4*9+4] + mr2.x * kernelsL[0*72+4*9+5] +
        bl2.x * kernelsL[0*72+4*9+6] + bc2.x * kernelsL[0*72+4*9+7] + br2.x * kernelsL[0*72+4*9+8] + 

        tl2.y * kernelsL[0*72+5*9+0] + tc2.y * kernelsL[0*72+5*9+1] + tr2.y * kernelsL[0*72+5*9+2] +
        ml2.y * kernelsL[0*72+5*9+3] + mc2.y * kernelsL[0*72+5*9+4] + mr2.y * kernelsL[0*72+5*9+5] +
        bl2.y * kernelsL[0*72+5*9+6] + bc2.y * kernelsL[0*72+5*9+7] + br2.y * kernelsL[0*72+5*9+8] + 

        tl2.z * kernelsL[0*72+6*9+0] + tc2.z * kernelsL[0*72+6*9+1] + tr2.z * kernelsL[0*72+6*9+2] +
        ml2.z * kernelsL[0*72+6*9+3] + mc2.z * kernelsL[0*72+6*9+4] + mr2.z * kernelsL[0*72+6*9+5] +
        bl2.z * kernelsL[0*72+6*9+6] + bc2.z * kernelsL[0*72+6*9+7] + br2.z * kernelsL[0*72+6*9+8] + 

        tl2.w * kernelsL[0*72+7*9+0] + tc2.w * kernelsL[0*72+7*9+1] + tr2.w * kernelsL[0*72+7*9+2] +
        ml2.w * kernelsL[0*72+7*9+3] + mc2.w * kernelsL[0*72+7*9+4] + mr2.w * kernelsL[0*72+7*9+5] +
        bl2.w * kernelsL[0*72+7*9+6] + bc2.w * kernelsL[0*72+7*9+7] + br2.w * kernelsL[0*72+7*9+8] + biasL[0]
        ,
        tl1.x * kernelsL[1*72+0*9+0] + tc1.x * kernelsL[1*72+0*9+1] + tr1.x * kernelsL[1*72+0*9+2] +
        ml1.x * kernelsL[1*72+0*9+3] + mc1.x * kernelsL[1*72+0*9+4] + mr1.x * kernelsL[1*72+0*9+5] +
        bl1.x * kernelsL[1*72+0*9+6] + bc1.x * kernelsL[1*72+0*9+7] + br1.x * kernelsL[1*72+0*9+8] + 

        tl1.y * kernelsL[1*72+1*9+0] + tc1.y * kernelsL[1*72+1*9+1] + tr1.y * kernelsL[1*72+1*9+2] +
        ml1.y * kernelsL[1*72+1*9+3] + mc1.y * kernelsL[1*72+1*9+4] + mr1.y * kernelsL[1*72+1*9+5] +
        bl1.y * kernelsL[1*72+1*9+6] + bc1.y * kernelsL[1*72+1*9+7] + br1.y * kernelsL[1*72+1*9+8] + 

        tl1.z * kernelsL[1*72+2*9+0] + tc1.z * kernelsL[1*72+2*9+1] + tr1.z * kernelsL[1*72+2*9+2] +
        ml1.z * kernelsL[1*72+2*9+3] + mc1.z * kernelsL[1*72+2*9+4] + mr1.z * kernelsL[1*72+2*9+5] +
        bl1.z * kernelsL[1*72+2*9+6] + bc1.z * kernelsL[1*72+2*9+7] + br1.z * kernelsL[1*72+2*9+8] + 

        tl1.w * kernelsL[1*72+3*9+0] + tc1.w * kernelsL[1*72+3*9+1] + tr1.w * kernelsL[1*72+3*9+2] +
        ml1.w * kernelsL[1*72+3*9+3] + mc1.w * kernelsL[1*72+3*9+4] + mr1.w * kernelsL[1*72+3*9+5] +
        bl1.w * kernelsL[1*72+3*9+6] + bc1.w * kernelsL[1*72+3*9+7] + br1.w * kernelsL[1*72+3*9+8] +

        tl2.x * kernelsL[1*72+4*9+0] + tc2.x * kernelsL[1*72+4*9+1] + tr2.x * kernelsL[1*72+4*9+2] +
        ml2.x * kernelsL[1*72+4*9+3] + mc2.x * kernelsL[1*72+4*9+4] + mr2.x * kernelsL[1*72+4*9+5] +
        bl2.x * kernelsL[1*72+4*9+6] + bc2.x * kernelsL[1*72+4*9+7] + br2.x * kernelsL[1*72+4*9+8] + 

        tl2.y * kernelsL[1*72+5*9+0] + tc2.y * kernelsL[1*72+5*9+1] + tr2.y * kernelsL[1*72+5*9+2] +
        ml2.y * kernelsL[1*72+5*9+3] + mc2.y * kernelsL[1*72+5*9+4] + mr2.y * kernelsL[1*72+5*9+5] +
        bl2.y * kernelsL[1*72+5*9+6] + bc2.y * kernelsL[1*72+5*9+7] + br2.y * kernelsL[1*72+5*9+8] + 

        tl2.z * kernelsL[1*72+6*9+0] + tc2.z * kernelsL[1*72+6*9+1] + tr2.z * kernelsL[1*72+6*9+2] +
        ml2.z * kernelsL[1*72+6*9+3] + mc2.z * kernelsL[1*72+6*9+4] + mr2.z * kernelsL[1*72+6*9+5] +
        bl2.z * kernelsL[1*72+6*9+6] + bc2.z * kernelsL[1*72+6*9+7] + br2.z * kernelsL[1*72+6*9+8] + 

        tl2.w * kernelsL[1*72+7*9+0] + tc2.w * kernelsL[1*72+7*9+1] + tr2.w * kernelsL[1*72+7*9+2] +
        ml2.w * kernelsL[1*72+7*9+3] + mc2.w * kernelsL[1*72+7*9+4] + mr2.w * kernelsL[1*72+7*9+5] +
        bl2.w * kernelsL[1*72+7*9+6] + bc2.w * kernelsL[1*72+7*9+7] + br2.w * kernelsL[1*72+7*9+8] + biasL[1]
        ,
        tl1.x * kernelsL[2*72+0*9+0] + tc1.x * kernelsL[2*72+0*9+1] + tr1.x * kernelsL[2*72+0*9+2] +
        ml1.x * kernelsL[2*72+0*9+3] + mc1.x * kernelsL[2*72+0*9+4] + mr1.x * kernelsL[2*72+0*9+5] +
        bl1.x * kernelsL[2*72+0*9+6] + bc1.x * kernelsL[2*72+0*9+7] + br1.x * kernelsL[2*72+0*9+8] + 

        tl1.y * kernelsL[2*72+1*9+0] + tc1.y * kernelsL[2*72+1*9+1] + tr1.y * kernelsL[2*72+1*9+2] +
        ml1.y * kernelsL[2*72+1*9+3] + mc1.y * kernelsL[2*72+1*9+4] + mr1.y * kernelsL[2*72+1*9+5] +
        bl1.y * kernelsL[2*72+1*9+6] + bc1.y * kernelsL[2*72+1*9+7] + br1.y * kernelsL[2*72+1*9+8] + 

        tl1.z * kernelsL[2*72+2*9+0] + tc1.z * kernelsL[2*72+2*9+1] + tr1.z * kernelsL[2*72+2*9+2] +
        ml1.z * kernelsL[2*72+2*9+3] + mc1.z * kernelsL[2*72+2*9+4] + mr1.z * kernelsL[2*72+2*9+5] +
        bl1.z * kernelsL[2*72+2*9+6] + bc1.z * kernelsL[2*72+2*9+7] + br1.z * kernelsL[2*72+2*9+8] + 

        tl1.w * kernelsL[2*72+3*9+0] + tc1.w * kernelsL[2*72+3*9+1] + tr1.w * kernelsL[2*72+3*9+2] +
        ml1.w * kernelsL[2*72+3*9+3] + mc1.w * kernelsL[2*72+3*9+4] + mr1.w * kernelsL[2*72+3*9+5] +
        bl1.w * kernelsL[2*72+3*9+6] + bc1.w * kernelsL[2*72+3*9+7] + br1.w * kernelsL[2*72+3*9+8] +

        tl2.x * kernelsL[2*72+4*9+0] + tc2.x * kernelsL[2*72+4*9+1] + tr2.x * kernelsL[2*72+4*9+2] +
        ml2.x * kernelsL[2*72+4*9+3] + mc2.x * kernelsL[2*72+4*9+4] + mr2.x * kernelsL[2*72+4*9+5] +
        bl2.x * kernelsL[2*72+4*9+6] + bc2.x * kernelsL[2*72+4*9+7] + br2.x * kernelsL[2*72+4*9+8] + 

        tl2.y * kernelsL[2*72+5*9+0] + tc2.y * kernelsL[2*72+5*9+1] + tr2.y * kernelsL[2*72+5*9+2] +
        ml2.y * kernelsL[2*72+5*9+3] + mc2.y * kernelsL[2*72+5*9+4] + mr2.y * kernelsL[2*72+5*9+5] +
        bl2.y * kernelsL[2*72+5*9+6] + bc2.y * kernelsL[2*72+5*9+7] + br2.y * kernelsL[2*72+5*9+8] + 

        tl2.z * kernelsL[2*72+6*9+0] + tc2.z * kernelsL[2*72+6*9+1] + tr2.z * kernelsL[2*72+6*9+2] +
        ml2.z * kernelsL[2*72+6*9+3] + mc2.z * kernelsL[2*72+6*9+4] + mr2.z * kernelsL[2*72+6*9+5] +
        bl2.z * kernelsL[2*72+6*9+6] + bc2.z * kernelsL[2*72+6*9+7] + br2.z * kernelsL[2*72+6*9+8] + 

        tl2.w * kernelsL[2*72+7*9+0] + tc2.w * kernelsL[2*72+7*9+1] + tr2.w * kernelsL[2*72+7*9+2] +
        ml2.w * kernelsL[2*72+7*9+3] + mc2.w * kernelsL[2*72+7*9+4] + mr2.w * kernelsL[2*72+7*9+5] +
        bl2.w * kernelsL[2*72+7*9+6] + bc2.w * kernelsL[2*72+7*9+7] + br2.w * kernelsL[2*72+7*9+8] + biasL[2]
        ,
        tl1.x * kernelsL[3*72+0*9+0] + tc1.x * kernelsL[3*72+0*9+1] + tr1.x * kernelsL[3*72+0*9+2] +
        ml1.x * kernelsL[3*72+0*9+3] + mc1.x * kernelsL[3*72+0*9+4] + mr1.x * kernelsL[3*72+0*9+5] +
        bl1.x * kernelsL[3*72+0*9+6] + bc1.x * kernelsL[3*72+0*9+7] + br1.x * kernelsL[3*72+0*9+8] + 

        tl1.y * kernelsL[3*72+1*9+0] + tc1.y * kernelsL[3*72+1*9+1] + tr1.y * kernelsL[3*72+1*9+2] +
        ml1.y * kernelsL[3*72+1*9+3] + mc1.y * kernelsL[3*72+1*9+4] + mr1.y * kernelsL[3*72+1*9+5] +
        bl1.y * kernelsL[3*72+1*9+6] + bc1.y * kernelsL[3*72+1*9+7] + br1.y * kernelsL[3*72+1*9+8] + 

        tl1.z * kernelsL[3*72+2*9+0] + tc1.z * kernelsL[3*72+2*9+1] + tr1.z * kernelsL[3*72+2*9+2] +
        ml1.z * kernelsL[3*72+2*9+3] + mc1.z * kernelsL[3*72+2*9+4] + mr1.z * kernelsL[3*72+2*9+5] +
        bl1.z * kernelsL[3*72+2*9+6] + bc1.z * kernelsL[3*72+2*9+7] + br1.z * kernelsL[3*72+2*9+8] + 

        tl1.w * kernelsL[3*72+3*9+0] + tc1.w * kernelsL[3*72+3*9+1] + tr1.w * kernelsL[3*72+3*9+2] +
        ml1.w * kernelsL[3*72+3*9+3] + mc1.w * kernelsL[3*72+3*9+4] + mr1.w * kernelsL[3*72+3*9+5] +
        bl1.w * kernelsL[3*72+3*9+6] + bc1.w * kernelsL[3*72+3*9+7] + br1.w * kernelsL[3*72+3*9+8] +

        tl2.x * kernelsL[3*72+4*9+0] + tc2.x * kernelsL[3*72+4*9+1] + tr2.x * kernelsL[3*72+4*9+2] +
        ml2.x * kernelsL[3*72+4*9+3] + mc2.x * kernelsL[3*72+4*9+4] + mr2.x * kernelsL[3*72+4*9+5] +
        bl2.x * kernelsL[3*72+4*9+6] + bc2.x * kernelsL[3*72+4*9+7] + br2.x * kernelsL[3*72+4*9+8] + 

        tl2.y * kernelsL[3*72+5*9+0] + tc2.y * kernelsL[3*72+5*9+1] + tr2.y * kernelsL[3*72+5*9+2] +
        ml2.y * kernelsL[3*72+5*9+3] + mc2.y * kernelsL[3*72+5*9+4] + mr2.y * kernelsL[3*72+5*9+5] +
        bl2.y * kernelsL[3*72+5*9+6] + bc2.y * kernelsL[3*72+5*9+7] + br2.y * kernelsL[3*72+5*9+8] + 

        tl2.z * kernelsL[3*72+6*9+0] + tc2.z * kernelsL[3*72+6*9+1] + tr2.z * kernelsL[3*72+6*9+2] +
        ml2.z * kernelsL[3*72+6*9+3] + mc2.z * kernelsL[3*72+6*9+4] + mr2.z * kernelsL[3*72+6*9+5] +
        bl2.z * kernelsL[3*72+6*9+6] + bc2.z * kernelsL[3*72+6*9+7] + br2.z * kernelsL[3*72+6*9+8] + 

        tl2.w * kernelsL[3*72+7*9+0] + tc2.w * kernelsL[3*72+7*9+1] + tr2.w * kernelsL[3*72+7*9+2] +
        ml2.w * kernelsL[3*72+7*9+3] + mc2.w * kernelsL[3*72+7*9+4] + mr2.w * kernelsL[3*72+7*9+5] +
        bl2.w * kernelsL[3*72+7*9+6] + bc2.w * kernelsL[3*72+7*9+7] + br2.w * kernelsL[3*72+7*9+8] + biasL[3]
    ));


    return c5678;
}

//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L4
//!BIND L1_1
//!BIND L1_2
//!SAVE L2_1
//!COMPONENTS 4

#define RELU(x) max(x, vec4(0.0f))

const float kernelsL[9 * 8 * 4] = float[9 * 8 * 4]
(
-2.7283e-39, -4.9031e-39, -2.1039e-39,
-1.0327e-39, -5.1679e-39, -4.3300e-39,
-5.2613e-39, -3.1707e-39, -6.0916e-39,
 1.5840e-39,  1.6709e-39,  1.6120e-39,
 1.6716e-39,  1.7418e-39,  1.6624e-39,
 1.5922e-39,  1.7383e-39,  1.5668e-39,
 1.1389e-01, -4.5774e-02,  6.1423e-02,
 1.3858e-01,  2.3102e-02, -6.5079e-02,
 1.3269e-01,  3.2387e-02,  7.6966e-02,
-2.1531e-39, -1.6063e-39, -3.2070e-39,
-2.8531e-39,  4.6956e-39,  1.4038e-39,
 2.0509e-39, -4.4924e-39, -5.3658e-39,
 1.1524e-01, -5.0115e-02,  9.4187e-02,
 4.2477e-02,  1.4197e-01,  2.4986e-02,
-2.8688e-02,  9.2289e-02,  4.1965e-02,
-2.1691e-01, -6.6916e-04, -1.3026e-01,
-1.9143e-01,  1.2211e-01,  1.2562e-01,
-1.2273e-01,  7.1045e-02,  1.2396e-01,
-8.0861e-02, -4.4301e-03,  6.3144e-03,
 3.0338e-02, -8.6463e-03,  5.5084e-02,
-1.8370e-01, -5.0287e-02, -7.2194e-02,
 7.4570e-02,  5.4483e-02, -1.2639e-02,
 1.2481e-01,  1.4683e-01, -4.7581e-02,
 1.6748e-01, -3.1374e-02, -1.7271e-02,
 1.9801e-39, -3.3469e-39, -4.7012e-39,
-2.9869e-39, -3.2752e-39, -2.2142e-39,
-4.2927e-39, -1.9635e-39, -8.7517e-40,
 2.7286e-39,  2.7755e-39,  2.7501e-39,
 2.7114e-39,  2.7711e-39,  2.6858e-39,
 2.5562e-39,  2.6523e-39,  2.5846e-39,
 1.4015e-01,  1.0486e-01,  1.2320e-01,
 4.6545e-02,  1.2068e-01,  9.2531e-02,
 1.0717e-01,  3.8738e-02,  1.0181e-01,
-7.4503e-40, -1.1490e-39,  6.1230e-41,
 2.4896e-39,  5.3740e-39, -1.4060e-39,
 1.9095e-39, -7.1020e-40,  3.5820e-39,
-1.4348e-02,  6.4128e-02,  6.1082e-02,
-1.1112e-02,  8.5993e-02,  2.4835e-02,
 1.2794e-01, -9.1072e-02, -1.3487e-02,
-5.8057e-02,  1.3080e-01,  1.0895e-01,
-1.6436e-01,  9.8593e-03,  1.5586e-02,
-1.5336e-01,  3.6391e-02,  1.4539e-01,
-4.6112e-02,  3.0102e-02,  6.2460e-02,
-2.5510e-02,  2.0437e-02, -5.6816e-02,
-1.0308e-01, -1.5284e-01, -7.1036e-02,
 5.5290e-02, -6.6632e-02,  4.2268e-02,
-2.7665e-02,  9.3415e-02,  5.1026e-02,
 1.5652e-01,  1.0835e-01,  9.6131e-02,
-4.2583e-39, -3.4889e-39, -5.7522e-39,
 4.2701e-40,  2.8095e-39, -3.5579e-39,
 2.2286e-39,  4.9865e-39,  4.0469e-39,
-6.4320e-40, -3.3384e-39, -5.9025e-39,
-7.9075e-40, -3.0577e-39, -6.0007e-39,
-8.9627e-40, -2.8374e-39, -5.8866e-39,
 6.3645e-03, -5.3080e-03, -5.1759e-02,
 1.0665e-01, -6.3126e-02,  5.0918e-02,
 7.2193e-02, -6.8836e-02, -6.5657e-02,
 2.8519e-39, -5.0955e-39, -9.6085e-40,
-3.3563e-39, -5.6038e-39, -1.6256e-39,
 2.6872e-39,  1.4728e-39, -1.9908e-39,
-1.5254e-02,  9.8323e-02,  4.5504e-02,
 1.3855e-01,  6.9300e-02,  1.9135e-01,
-5.2321e-02, -6.0227e-03, -1.1734e-04,
-1.4457e-01,  9.2761e-02,  4.5219e-02,
-3.0361e-01,  3.4673e-01, -2.3110e-01,
 2.1017e-01,  2.4983e-01,  3.1659e-01,
-6.0569e-02, -5.4348e-02, -7.6719e-02,
-6.5060e-02,  2.8902e-01,  8.0732e-02,
-3.3425e-01, -3.1361e-01, -2.7183e-01,
 2.8035e-02, -5.8134e-02, -4.3880e-02,
-1.6375e-02,  9.8195e-02, -7.4011e-02,
-5.9523e-02,  1.0234e-01, -5.3357e-02,
 2.3364e-39, -2.5324e-39, -4.8333e-40,
 2.2903e-41, -3.3061e-39, -2.5779e-39,
-1.8164e-39, -4.9236e-39, -4.9272e-39,
-1.2809e-39, -1.1698e-39, -1.2564e-39,
-1.3111e-39, -1.1778e-39, -1.2543e-39,
-1.4772e-39, -1.4021e-39, -1.4721e-39,
 8.8919e-02, -3.4541e-03, -4.9619e-02,
 1.0997e-01,  1.0257e-01,  6.9950e-02,
 9.2624e-02,  3.2712e-02,  8.7916e-02,
-5.0242e-39, -6.1320e-39,  8.7891e-40,
-4.9951e-39,  2.3873e-39, -2.7823e-39,
-3.6739e-39, -1.8903e-39,  5.2150e-39,
 9.6288e-02,  9.7568e-03, -5.8178e-02,
 2.3313e-02,  1.1725e-01,  1.0291e-01,
-1.0111e-01,  8.3706e-02,  9.6575e-03,
-8.2531e-02,  7.0089e-02,  1.0821e-01,
-1.1016e-01,  1.8977e-01,  2.5576e-01,
-1.0221e-01,  5.9236e-02,  6.1678e-02,
 2.6234e-02,  9.6868e-02,  9.2432e-02,
 4.9881e-02,  5.9121e-02, -1.0477e-02,
-1.4693e-01, -1.0030e-01, -1.0608e-01,
 1.1936e-01, -2.2301e-02,  1.1363e-01,
 1.3981e-01,  6.7734e-02, -8.2775e-02,
 1.0404e-01, -7.7360e-03,  4.2523e-02
);

const float biasL[4] = float[4]
(
-0.0091, -0.0055,  0.0237,  0.0093
);

vec4 hook()
{
    vec4 tl1 = L1_1_texOff(vec2(-1,-1));
    vec4 tc1 = L1_1_texOff(vec2(0,-1));
    vec4 tr1 = L1_1_texOff(vec2(1,-1));
    vec4 ml1 = L1_1_texOff(vec2(-1,0));
    vec4 mc1 = L1_1_texOff(vec2(0,0));
    vec4 mr1 = L1_1_texOff(vec2(1,0));
    vec4 bl1 = L1_1_texOff(vec2(-1,1));
    vec4 bc1 = L1_1_texOff(vec2(0,1));
    vec4 br1 = L1_1_texOff(vec2(1,1));

    vec4 tl2 = L1_2_texOff(vec2(-1,-1));
    vec4 tc2 = L1_2_texOff(vec2(0,-1));
    vec4 tr2 = L1_2_texOff(vec2(1,-1));
    vec4 ml2 = L1_2_texOff(vec2(-1,0));
    vec4 mc2 = L1_2_texOff(vec2(0,0));
    vec4 mr2 = L1_2_texOff(vec2(1,0));
    vec4 bl2 = L1_2_texOff(vec2(-1,1));
    vec4 bc2 = L1_2_texOff(vec2(0,1));
    vec4 br2 = L1_2_texOff(vec2(1,1));

    vec4 c1234 = RELU(vec4(
        tl1.x * kernelsL[0*72+0*9+0] + tc1.x * kernelsL[0*72+0*9+1] + tr1.x * kernelsL[0*72+0*9+2] +
        ml1.x * kernelsL[0*72+0*9+3] + mc1.x * kernelsL[0*72+0*9+4] + mr1.x * kernelsL[0*72+0*9+5] +
        bl1.x * kernelsL[0*72+0*9+6] + bc1.x * kernelsL[0*72+0*9+7] + br1.x * kernelsL[0*72+0*9+8] + 

        tl1.y * kernelsL[0*72+1*9+0] + tc1.y * kernelsL[0*72+1*9+1] + tr1.y * kernelsL[0*72+1*9+2] +
        ml1.y * kernelsL[0*72+1*9+3] + mc1.y * kernelsL[0*72+1*9+4] + mr1.y * kernelsL[0*72+1*9+5] +
        bl1.y * kernelsL[0*72+1*9+6] + bc1.y * kernelsL[0*72+1*9+7] + br1.y * kernelsL[0*72+1*9+8] + 

        tl1.z * kernelsL[0*72+2*9+0] + tc1.z * kernelsL[0*72+2*9+1] + tr1.z * kernelsL[0*72+2*9+2] +
        ml1.z * kernelsL[0*72+2*9+3] + mc1.z * kernelsL[0*72+2*9+4] + mr1.z * kernelsL[0*72+2*9+5] +
        bl1.z * kernelsL[0*72+2*9+6] + bc1.z * kernelsL[0*72+2*9+7] + br1.z * kernelsL[0*72+2*9+8] + 

        tl1.w * kernelsL[0*72+3*9+0] + tc1.w * kernelsL[0*72+3*9+1] + tr1.w * kernelsL[0*72+3*9+2] +
        ml1.w * kernelsL[0*72+3*9+3] + mc1.w * kernelsL[0*72+3*9+4] + mr1.w * kernelsL[0*72+3*9+5] +
        bl1.w * kernelsL[0*72+3*9+6] + bc1.w * kernelsL[0*72+3*9+7] + br1.w * kernelsL[0*72+3*9+8] +

        tl2.x * kernelsL[0*72+4*9+0] + tc2.x * kernelsL[0*72+4*9+1] + tr2.x * kernelsL[0*72+4*9+2] +
        ml2.x * kernelsL[0*72+4*9+3] + mc2.x * kernelsL[0*72+4*9+4] + mr2.x * kernelsL[0*72+4*9+5] +
        bl2.x * kernelsL[0*72+4*9+6] + bc2.x * kernelsL[0*72+4*9+7] + br2.x * kernelsL[0*72+4*9+8] + 

        tl2.y * kernelsL[0*72+5*9+0] + tc2.y * kernelsL[0*72+5*9+1] + tr2.y * kernelsL[0*72+5*9+2] +
        ml2.y * kernelsL[0*72+5*9+3] + mc2.y * kernelsL[0*72+5*9+4] + mr2.y * kernelsL[0*72+5*9+5] +
        bl2.y * kernelsL[0*72+5*9+6] + bc2.y * kernelsL[0*72+5*9+7] + br2.y * kernelsL[0*72+5*9+8] + 

        tl2.z * kernelsL[0*72+6*9+0] + tc2.z * kernelsL[0*72+6*9+1] + tr2.z * kernelsL[0*72+6*9+2] +
        ml2.z * kernelsL[0*72+6*9+3] + mc2.z * kernelsL[0*72+6*9+4] + mr2.z * kernelsL[0*72+6*9+5] +
        bl2.z * kernelsL[0*72+6*9+6] + bc2.z * kernelsL[0*72+6*9+7] + br2.z * kernelsL[0*72+6*9+8] + 

        tl2.w * kernelsL[0*72+7*9+0] + tc2.w * kernelsL[0*72+7*9+1] + tr2.w * kernelsL[0*72+7*9+2] +
        ml2.w * kernelsL[0*72+7*9+3] + mc2.w * kernelsL[0*72+7*9+4] + mr2.w * kernelsL[0*72+7*9+5] +
        bl2.w * kernelsL[0*72+7*9+6] + bc2.w * kernelsL[0*72+7*9+7] + br2.w * kernelsL[0*72+7*9+8] + biasL[0]
        ,
        tl1.x * kernelsL[1*72+0*9+0] + tc1.x * kernelsL[1*72+0*9+1] + tr1.x * kernelsL[1*72+0*9+2] +
        ml1.x * kernelsL[1*72+0*9+3] + mc1.x * kernelsL[1*72+0*9+4] + mr1.x * kernelsL[1*72+0*9+5] +
        bl1.x * kernelsL[1*72+0*9+6] + bc1.x * kernelsL[1*72+0*9+7] + br1.x * kernelsL[1*72+0*9+8] + 

        tl1.y * kernelsL[1*72+1*9+0] + tc1.y * kernelsL[1*72+1*9+1] + tr1.y * kernelsL[1*72+1*9+2] +
        ml1.y * kernelsL[1*72+1*9+3] + mc1.y * kernelsL[1*72+1*9+4] + mr1.y * kernelsL[1*72+1*9+5] +
        bl1.y * kernelsL[1*72+1*9+6] + bc1.y * kernelsL[1*72+1*9+7] + br1.y * kernelsL[1*72+1*9+8] + 

        tl1.z * kernelsL[1*72+2*9+0] + tc1.z * kernelsL[1*72+2*9+1] + tr1.z * kernelsL[1*72+2*9+2] +
        ml1.z * kernelsL[1*72+2*9+3] + mc1.z * kernelsL[1*72+2*9+4] + mr1.z * kernelsL[1*72+2*9+5] +
        bl1.z * kernelsL[1*72+2*9+6] + bc1.z * kernelsL[1*72+2*9+7] + br1.z * kernelsL[1*72+2*9+8] + 

        tl1.w * kernelsL[1*72+3*9+0] + tc1.w * kernelsL[1*72+3*9+1] + tr1.w * kernelsL[1*72+3*9+2] +
        ml1.w * kernelsL[1*72+3*9+3] + mc1.w * kernelsL[1*72+3*9+4] + mr1.w * kernelsL[1*72+3*9+5] +
        bl1.w * kernelsL[1*72+3*9+6] + bc1.w * kernelsL[1*72+3*9+7] + br1.w * kernelsL[1*72+3*9+8] +

        tl2.x * kernelsL[1*72+4*9+0] + tc2.x * kernelsL[1*72+4*9+1] + tr2.x * kernelsL[1*72+4*9+2] +
        ml2.x * kernelsL[1*72+4*9+3] + mc2.x * kernelsL[1*72+4*9+4] + mr2.x * kernelsL[1*72+4*9+5] +
        bl2.x * kernelsL[1*72+4*9+6] + bc2.x * kernelsL[1*72+4*9+7] + br2.x * kernelsL[1*72+4*9+8] + 

        tl2.y * kernelsL[1*72+5*9+0] + tc2.y * kernelsL[1*72+5*9+1] + tr2.y * kernelsL[1*72+5*9+2] +
        ml2.y * kernelsL[1*72+5*9+3] + mc2.y * kernelsL[1*72+5*9+4] + mr2.y * kernelsL[1*72+5*9+5] +
        bl2.y * kernelsL[1*72+5*9+6] + bc2.y * kernelsL[1*72+5*9+7] + br2.y * kernelsL[1*72+5*9+8] + 

        tl2.z * kernelsL[1*72+6*9+0] + tc2.z * kernelsL[1*72+6*9+1] + tr2.z * kernelsL[1*72+6*9+2] +
        ml2.z * kernelsL[1*72+6*9+3] + mc2.z * kernelsL[1*72+6*9+4] + mr2.z * kernelsL[1*72+6*9+5] +
        bl2.z * kernelsL[1*72+6*9+6] + bc2.z * kernelsL[1*72+6*9+7] + br2.z * kernelsL[1*72+6*9+8] + 

        tl2.w * kernelsL[1*72+7*9+0] + tc2.w * kernelsL[1*72+7*9+1] + tr2.w * kernelsL[1*72+7*9+2] +
        ml2.w * kernelsL[1*72+7*9+3] + mc2.w * kernelsL[1*72+7*9+4] + mr2.w * kernelsL[1*72+7*9+5] +
        bl2.w * kernelsL[1*72+7*9+6] + bc2.w * kernelsL[1*72+7*9+7] + br2.w * kernelsL[1*72+7*9+8] + biasL[1]
        ,
        tl1.x * kernelsL[2*72+0*9+0] + tc1.x * kernelsL[2*72+0*9+1] + tr1.x * kernelsL[2*72+0*9+2] +
        ml1.x * kernelsL[2*72+0*9+3] + mc1.x * kernelsL[2*72+0*9+4] + mr1.x * kernelsL[2*72+0*9+5] +
        bl1.x * kernelsL[2*72+0*9+6] + bc1.x * kernelsL[2*72+0*9+7] + br1.x * kernelsL[2*72+0*9+8] + 

        tl1.y * kernelsL[2*72+1*9+0] + tc1.y * kernelsL[2*72+1*9+1] + tr1.y * kernelsL[2*72+1*9+2] +
        ml1.y * kernelsL[2*72+1*9+3] + mc1.y * kernelsL[2*72+1*9+4] + mr1.y * kernelsL[2*72+1*9+5] +
        bl1.y * kernelsL[2*72+1*9+6] + bc1.y * kernelsL[2*72+1*9+7] + br1.y * kernelsL[2*72+1*9+8] + 

        tl1.z * kernelsL[2*72+2*9+0] + tc1.z * kernelsL[2*72+2*9+1] + tr1.z * kernelsL[2*72+2*9+2] +
        ml1.z * kernelsL[2*72+2*9+3] + mc1.z * kernelsL[2*72+2*9+4] + mr1.z * kernelsL[2*72+2*9+5] +
        bl1.z * kernelsL[2*72+2*9+6] + bc1.z * kernelsL[2*72+2*9+7] + br1.z * kernelsL[2*72+2*9+8] + 

        tl1.w * kernelsL[2*72+3*9+0] + tc1.w * kernelsL[2*72+3*9+1] + tr1.w * kernelsL[2*72+3*9+2] +
        ml1.w * kernelsL[2*72+3*9+3] + mc1.w * kernelsL[2*72+3*9+4] + mr1.w * kernelsL[2*72+3*9+5] +
        bl1.w * kernelsL[2*72+3*9+6] + bc1.w * kernelsL[2*72+3*9+7] + br1.w * kernelsL[2*72+3*9+8] +

        tl2.x * kernelsL[2*72+4*9+0] + tc2.x * kernelsL[2*72+4*9+1] + tr2.x * kernelsL[2*72+4*9+2] +
        ml2.x * kernelsL[2*72+4*9+3] + mc2.x * kernelsL[2*72+4*9+4] + mr2.x * kernelsL[2*72+4*9+5] +
        bl2.x * kernelsL[2*72+4*9+6] + bc2.x * kernelsL[2*72+4*9+7] + br2.x * kernelsL[2*72+4*9+8] + 

        tl2.y * kernelsL[2*72+5*9+0] + tc2.y * kernelsL[2*72+5*9+1] + tr2.y * kernelsL[2*72+5*9+2] +
        ml2.y * kernelsL[2*72+5*9+3] + mc2.y * kernelsL[2*72+5*9+4] + mr2.y * kernelsL[2*72+5*9+5] +
        bl2.y * kernelsL[2*72+5*9+6] + bc2.y * kernelsL[2*72+5*9+7] + br2.y * kernelsL[2*72+5*9+8] + 

        tl2.z * kernelsL[2*72+6*9+0] + tc2.z * kernelsL[2*72+6*9+1] + tr2.z * kernelsL[2*72+6*9+2] +
        ml2.z * kernelsL[2*72+6*9+3] + mc2.z * kernelsL[2*72+6*9+4] + mr2.z * kernelsL[2*72+6*9+5] +
        bl2.z * kernelsL[2*72+6*9+6] + bc2.z * kernelsL[2*72+6*9+7] + br2.z * kernelsL[2*72+6*9+8] + 

        tl2.w * kernelsL[2*72+7*9+0] + tc2.w * kernelsL[2*72+7*9+1] + tr2.w * kernelsL[2*72+7*9+2] +
        ml2.w * kernelsL[2*72+7*9+3] + mc2.w * kernelsL[2*72+7*9+4] + mr2.w * kernelsL[2*72+7*9+5] +
        bl2.w * kernelsL[2*72+7*9+6] + bc2.w * kernelsL[2*72+7*9+7] + br2.w * kernelsL[2*72+7*9+8] + biasL[2]
        ,
        tl1.x * kernelsL[3*72+0*9+0] + tc1.x * kernelsL[3*72+0*9+1] + tr1.x * kernelsL[3*72+0*9+2] +
        ml1.x * kernelsL[3*72+0*9+3] + mc1.x * kernelsL[3*72+0*9+4] + mr1.x * kernelsL[3*72+0*9+5] +
        bl1.x * kernelsL[3*72+0*9+6] + bc1.x * kernelsL[3*72+0*9+7] + br1.x * kernelsL[3*72+0*9+8] + 

        tl1.y * kernelsL[3*72+1*9+0] + tc1.y * kernelsL[3*72+1*9+1] + tr1.y * kernelsL[3*72+1*9+2] +
        ml1.y * kernelsL[3*72+1*9+3] + mc1.y * kernelsL[3*72+1*9+4] + mr1.y * kernelsL[3*72+1*9+5] +
        bl1.y * kernelsL[3*72+1*9+6] + bc1.y * kernelsL[3*72+1*9+7] + br1.y * kernelsL[3*72+1*9+8] + 

        tl1.z * kernelsL[3*72+2*9+0] + tc1.z * kernelsL[3*72+2*9+1] + tr1.z * kernelsL[3*72+2*9+2] +
        ml1.z * kernelsL[3*72+2*9+3] + mc1.z * kernelsL[3*72+2*9+4] + mr1.z * kernelsL[3*72+2*9+5] +
        bl1.z * kernelsL[3*72+2*9+6] + bc1.z * kernelsL[3*72+2*9+7] + br1.z * kernelsL[3*72+2*9+8] + 

        tl1.w * kernelsL[3*72+3*9+0] + tc1.w * kernelsL[3*72+3*9+1] + tr1.w * kernelsL[3*72+3*9+2] +
        ml1.w * kernelsL[3*72+3*9+3] + mc1.w * kernelsL[3*72+3*9+4] + mr1.w * kernelsL[3*72+3*9+5] +
        bl1.w * kernelsL[3*72+3*9+6] + bc1.w * kernelsL[3*72+3*9+7] + br1.w * kernelsL[3*72+3*9+8] +

        tl2.x * kernelsL[3*72+4*9+0] + tc2.x * kernelsL[3*72+4*9+1] + tr2.x * kernelsL[3*72+4*9+2] +
        ml2.x * kernelsL[3*72+4*9+3] + mc2.x * kernelsL[3*72+4*9+4] + mr2.x * kernelsL[3*72+4*9+5] +
        bl2.x * kernelsL[3*72+4*9+6] + bc2.x * kernelsL[3*72+4*9+7] + br2.x * kernelsL[3*72+4*9+8] + 

        tl2.y * kernelsL[3*72+5*9+0] + tc2.y * kernelsL[3*72+5*9+1] + tr2.y * kernelsL[3*72+5*9+2] +
        ml2.y * kernelsL[3*72+5*9+3] + mc2.y * kernelsL[3*72+5*9+4] + mr2.y * kernelsL[3*72+5*9+5] +
        bl2.y * kernelsL[3*72+5*9+6] + bc2.y * kernelsL[3*72+5*9+7] + br2.y * kernelsL[3*72+5*9+8] + 

        tl2.z * kernelsL[3*72+6*9+0] + tc2.z * kernelsL[3*72+6*9+1] + tr2.z * kernelsL[3*72+6*9+2] +
        ml2.z * kernelsL[3*72+6*9+3] + mc2.z * kernelsL[3*72+6*9+4] + mr2.z * kernelsL[3*72+6*9+5] +
        bl2.z * kernelsL[3*72+6*9+6] + bc2.z * kernelsL[3*72+6*9+7] + br2.z * kernelsL[3*72+6*9+8] + 

        tl2.w * kernelsL[3*72+7*9+0] + tc2.w * kernelsL[3*72+7*9+1] + tr2.w * kernelsL[3*72+7*9+2] +
        ml2.w * kernelsL[3*72+7*9+3] + mc2.w * kernelsL[3*72+7*9+4] + mr2.w * kernelsL[3*72+7*9+5] +
        bl2.w * kernelsL[3*72+7*9+6] + bc2.w * kernelsL[3*72+7*9+7] + br2.w * kernelsL[3*72+7*9+8] + biasL[3]
    ));


    return c1234;
}


//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L4
//!BIND L1_1
//!BIND L1_2
//!SAVE L2_2
//!COMPONENTS 4

#define RELU(x) max(x, vec4(0.0f))

const float kernelsL[9 * 8 * 4] = float[9 * 8 * 4]
(
-2.6052e-39,  5.7201e-39, -5.6049e-39,
-3.6314e-39, -5.9232e-39, -3.6970e-39,
 3.4360e-39, -5.6848e-39, -3.8308e-39,
 4.6279e-39,  5.8135e-39,  2.0652e-39,
 3.9864e-39,  4.4000e-39,  5.5163e-39,
 2.9644e-39,  2.7537e-39,  3.6593e-39,
 4.7872e-02, -2.5857e-02,  4.8810e-02,
 1.0389e-01, -1.0782e-01,  4.1365e-02,
 9.5778e-02, -5.2341e-02,  4.5947e-02,
-8.2652e-40, -5.7602e-39,  4.6187e-39,
-2.8365e-39,  1.4981e-39,  6.2504e-39,
-4.8330e-39,  4.0283e-39,  4.9792e-39,
-1.0893e-03, -8.2708e-02, -1.7925e-01,
 8.3461e-02,  3.1339e-02,  8.8096e-02,
 7.3139e-02, -1.2212e-01,  1.0489e-02,
-2.4187e-01, -3.8397e-01,  1.3730e-01,
 1.9217e-01,  1.4101e-01,  4.9795e-01,
-1.1441e-01,  3.3343e-01,  7.9194e-02,
 1.4556e-01, -5.1060e-01,  2.1556e-01,
 3.5719e-01,  2.7282e-01, -1.9015e-01,
-1.0941e-01,  2.7634e-02,  1.1833e-01,
-9.3316e-02, -4.1307e-03,  7.8613e-02,
-2.1526e-02, -6.7141e-02,  2.5513e-02,
-3.3942e-02, -8.6282e-02,  3.0446e-02,
-4.5124e-39, -2.7154e-39,  4.9467e-39,
-4.2299e-39, -5.9485e-39, -2.9606e-39,
-4.7642e-39, -4.7981e-39, -4.0169e-39,
-3.8238e-39,  5.7381e-39,  4.0097e-39,
 1.9550e-39,  4.5523e-39,  3.1206e-39,
 6.0200e-39,  3.0406e-39,  2.0498e-39,
-3.2474e-01,  1.1052e-02,  4.7197e-02,
-1.4658e-01,  1.6728e-01,  5.2190e-02,
 4.3174e-02,  4.5864e-02,  5.4472e-02,
 2.6403e-39,  2.7421e-39, -4.3011e-39,
-3.6258e-39, -1.3708e-39,  3.6147e-39,
-1.9471e-39,  4.5896e-39,  4.5992e-39,
-9.9986e-02,  7.0727e-02,  8.5023e-02,
 2.2501e-02,  1.4343e-01,  1.1878e-01,
 2.8126e-02,  7.3239e-02,  1.0468e-02,
 4.5032e-01,  4.4730e-01,  1.3446e-01,
-1.3374e-01,  8.8554e-02,  3.5610e-01,
 3.0584e-01,  2.3536e-01,  1.6161e-01,
-5.1485e-01,  1.2372e-01,  5.4379e-02,
-2.9665e-01, -3.3157e-02, -1.8688e-01,
 5.1777e-02, -1.4315e-01, -1.1366e-01,
-2.4471e-01,  5.5554e-02,  8.9284e-02,
-1.6870e-01,  7.6156e-02,  1.2472e-01,
-1.5633e-01,  4.3184e-03,  1.1078e-01,
 4.0579e-39, -3.8271e-39,  1.1535e-39,
 6.6968e-40, -1.1545e-39, -5.4217e-40,
 3.5566e-39, -4.4956e-40, -1.7097e-39,
-4.1778e-39, -3.7655e-39, -3.7148e-39,
-3.8013e-39, -3.5225e-39, -3.4678e-39,
-3.8369e-39, -3.5583e-39, -3.6518e-39,
-1.4894e-02,  2.4801e-03, -4.6996e-02,
 6.7453e-04,  1.8799e-02,  2.9889e-02,
 7.2700e-03,  1.2385e-01,  9.2522e-02,
 3.9300e-39,  3.1853e-39,  2.8376e-39,
 2.8888e-39, -4.8734e-39,  2.3402e-39,
-3.9710e-39, -4.3243e-39,  4.1151e-39,
 1.6399e-02, -8.2828e-02, -5.8361e-02,
 2.1315e-02,  1.1968e-02,  6.8727e-02,
 3.8558e-02,  1.5451e-02,  5.4465e-04,
 1.0549e-02, -8.6468e-02, -1.8535e-01,
-1.3616e-01,  2.7371e-01,  1.1157e-01,
-1.7097e-01,  1.3659e-01,  2.2831e-02,
-3.3897e-02,  1.3307e-01,  7.4482e-03,
 4.8120e-01,  7.7053e-01,  5.3354e-01,
-2.4277e-01, -5.9136e-02, -1.3419e-01,
-7.4653e-02, -6.4169e-02, -2.9526e-02,
-3.6336e-02,  7.2362e-02, -3.5332e-02,
 6.2628e-02,  6.2278e-02,  3.5639e-02,
 3.6614e-39, -2.6150e-39, -3.5229e-39,
 5.3538e-39, -1.2368e-39,  2.1530e-39,
 4.8585e-39, -2.4150e-39,  5.2220e-40,
 3.8610e-40,  1.4772e-39,  2.1962e-39,
-1.8493e-40,  1.1409e-39,  1.7309e-39,
-2.5751e-40,  9.1351e-40,  1.3106e-39,
 6.2867e-02, -1.2727e-01, -6.5307e-02,
 1.1415e-01, -4.5529e-02, -1.1358e-01,
 4.3427e-02, -6.0994e-02, -7.7808e-02,
-4.1831e-39,  1.3230e-39,  5.5853e-39,
-3.4646e-39, -7.2824e-40, -3.4263e-39,
 1.5344e-39, -5.8245e-39,  1.9910e-39,
 1.1000e-02, -3.7088e-03, -8.0042e-02,
 9.7603e-02,  8.6581e-02, -1.8921e-03,
 2.2820e-01,  6.8073e-02, -8.1081e-02,
-3.3901e-01, -1.1231e-01, -8.6476e-02,
 1.1147e-01,  4.9587e-01, -1.7039e-01,
-2.0702e-01,  5.8730e-02, -1.3475e-01,
 2.3548e-01, -6.8044e-02,  9.4296e-02,
 4.4803e-01,  6.1517e-03, -5.5192e-02,
-2.7304e-01, -2.6003e-02,  4.0713e-01,
 2.8621e-02,  6.2698e-03, -1.4746e-01,
 9.4819e-02, -1.3109e-02,  3.5540e-02,
 4.4047e-02,  3.5066e-02, -9.5886e-03
);

const float biasL[4] = float[4]
(
-0.0479,  0.0188, -0.0034,  0.0399
);

vec4 hook()
{
    vec4 tl1 = L1_1_texOff(vec2(-1,-1));
    vec4 tc1 = L1_1_texOff(vec2(0,-1));
    vec4 tr1 = L1_1_texOff(vec2(1,-1));
    vec4 ml1 = L1_1_texOff(vec2(-1,0));
    vec4 mc1 = L1_1_texOff(vec2(0,0));
    vec4 mr1 = L1_1_texOff(vec2(1,0));
    vec4 bl1 = L1_1_texOff(vec2(-1,1));
    vec4 bc1 = L1_1_texOff(vec2(0,1));
    vec4 br1 = L1_1_texOff(vec2(1,1));

    vec4 tl2 = L1_2_texOff(vec2(-1,-1));
    vec4 tc2 = L1_2_texOff(vec2(0,-1));
    vec4 tr2 = L1_2_texOff(vec2(1,-1));
    vec4 ml2 = L1_2_texOff(vec2(-1,0));
    vec4 mc2 = L1_2_texOff(vec2(0,0));
    vec4 mr2 = L1_2_texOff(vec2(1,0));
    vec4 bl2 = L1_2_texOff(vec2(-1,1));
    vec4 bc2 = L1_2_texOff(vec2(0,1));
    vec4 br2 = L1_2_texOff(vec2(1,1));

    vec4 c5678 = RELU(vec4(
        tl1.x * kernelsL[0*72+0*9+0] + tc1.x * kernelsL[0*72+0*9+1] + tr1.x * kernelsL[0*72+0*9+2] +
        ml1.x * kernelsL[0*72+0*9+3] + mc1.x * kernelsL[0*72+0*9+4] + mr1.x * kernelsL[0*72+0*9+5] +
        bl1.x * kernelsL[0*72+0*9+6] + bc1.x * kernelsL[0*72+0*9+7] + br1.x * kernelsL[0*72+0*9+8] + 

        tl1.y * kernelsL[0*72+1*9+0] + tc1.y * kernelsL[0*72+1*9+1] + tr1.y * kernelsL[0*72+1*9+2] +
        ml1.y * kernelsL[0*72+1*9+3] + mc1.y * kernelsL[0*72+1*9+4] + mr1.y * kernelsL[0*72+1*9+5] +
        bl1.y * kernelsL[0*72+1*9+6] + bc1.y * kernelsL[0*72+1*9+7] + br1.y * kernelsL[0*72+1*9+8] + 

        tl1.z * kernelsL[0*72+2*9+0] + tc1.z * kernelsL[0*72+2*9+1] + tr1.z * kernelsL[0*72+2*9+2] +
        ml1.z * kernelsL[0*72+2*9+3] + mc1.z * kernelsL[0*72+2*9+4] + mr1.z * kernelsL[0*72+2*9+5] +
        bl1.z * kernelsL[0*72+2*9+6] + bc1.z * kernelsL[0*72+2*9+7] + br1.z * kernelsL[0*72+2*9+8] + 

        tl1.w * kernelsL[0*72+3*9+0] + tc1.w * kernelsL[0*72+3*9+1] + tr1.w * kernelsL[0*72+3*9+2] +
        ml1.w * kernelsL[0*72+3*9+3] + mc1.w * kernelsL[0*72+3*9+4] + mr1.w * kernelsL[0*72+3*9+5] +
        bl1.w * kernelsL[0*72+3*9+6] + bc1.w * kernelsL[0*72+3*9+7] + br1.w * kernelsL[0*72+3*9+8] +

        tl2.x * kernelsL[0*72+4*9+0] + tc2.x * kernelsL[0*72+4*9+1] + tr2.x * kernelsL[0*72+4*9+2] +
        ml2.x * kernelsL[0*72+4*9+3] + mc2.x * kernelsL[0*72+4*9+4] + mr2.x * kernelsL[0*72+4*9+5] +
        bl2.x * kernelsL[0*72+4*9+6] + bc2.x * kernelsL[0*72+4*9+7] + br2.x * kernelsL[0*72+4*9+8] + 

        tl2.y * kernelsL[0*72+5*9+0] + tc2.y * kernelsL[0*72+5*9+1] + tr2.y * kernelsL[0*72+5*9+2] +
        ml2.y * kernelsL[0*72+5*9+3] + mc2.y * kernelsL[0*72+5*9+4] + mr2.y * kernelsL[0*72+5*9+5] +
        bl2.y * kernelsL[0*72+5*9+6] + bc2.y * kernelsL[0*72+5*9+7] + br2.y * kernelsL[0*72+5*9+8] + 

        tl2.z * kernelsL[0*72+6*9+0] + tc2.z * kernelsL[0*72+6*9+1] + tr2.z * kernelsL[0*72+6*9+2] +
        ml2.z * kernelsL[0*72+6*9+3] + mc2.z * kernelsL[0*72+6*9+4] + mr2.z * kernelsL[0*72+6*9+5] +
        bl2.z * kernelsL[0*72+6*9+6] + bc2.z * kernelsL[0*72+6*9+7] + br2.z * kernelsL[0*72+6*9+8] + 

        tl2.w * kernelsL[0*72+7*9+0] + tc2.w * kernelsL[0*72+7*9+1] + tr2.w * kernelsL[0*72+7*9+2] +
        ml2.w * kernelsL[0*72+7*9+3] + mc2.w * kernelsL[0*72+7*9+4] + mr2.w * kernelsL[0*72+7*9+5] +
        bl2.w * kernelsL[0*72+7*9+6] + bc2.w * kernelsL[0*72+7*9+7] + br2.w * kernelsL[0*72+7*9+8] + biasL[0]
        ,
        tl1.x * kernelsL[1*72+0*9+0] + tc1.x * kernelsL[1*72+0*9+1] + tr1.x * kernelsL[1*72+0*9+2] +
        ml1.x * kernelsL[1*72+0*9+3] + mc1.x * kernelsL[1*72+0*9+4] + mr1.x * kernelsL[1*72+0*9+5] +
        bl1.x * kernelsL[1*72+0*9+6] + bc1.x * kernelsL[1*72+0*9+7] + br1.x * kernelsL[1*72+0*9+8] + 

        tl1.y * kernelsL[1*72+1*9+0] + tc1.y * kernelsL[1*72+1*9+1] + tr1.y * kernelsL[1*72+1*9+2] +
        ml1.y * kernelsL[1*72+1*9+3] + mc1.y * kernelsL[1*72+1*9+4] + mr1.y * kernelsL[1*72+1*9+5] +
        bl1.y * kernelsL[1*72+1*9+6] + bc1.y * kernelsL[1*72+1*9+7] + br1.y * kernelsL[1*72+1*9+8] + 

        tl1.z * kernelsL[1*72+2*9+0] + tc1.z * kernelsL[1*72+2*9+1] + tr1.z * kernelsL[1*72+2*9+2] +
        ml1.z * kernelsL[1*72+2*9+3] + mc1.z * kernelsL[1*72+2*9+4] + mr1.z * kernelsL[1*72+2*9+5] +
        bl1.z * kernelsL[1*72+2*9+6] + bc1.z * kernelsL[1*72+2*9+7] + br1.z * kernelsL[1*72+2*9+8] + 

        tl1.w * kernelsL[1*72+3*9+0] + tc1.w * kernelsL[1*72+3*9+1] + tr1.w * kernelsL[1*72+3*9+2] +
        ml1.w * kernelsL[1*72+3*9+3] + mc1.w * kernelsL[1*72+3*9+4] + mr1.w * kernelsL[1*72+3*9+5] +
        bl1.w * kernelsL[1*72+3*9+6] + bc1.w * kernelsL[1*72+3*9+7] + br1.w * kernelsL[1*72+3*9+8] +

        tl2.x * kernelsL[1*72+4*9+0] + tc2.x * kernelsL[1*72+4*9+1] + tr2.x * kernelsL[1*72+4*9+2] +
        ml2.x * kernelsL[1*72+4*9+3] + mc2.x * kernelsL[1*72+4*9+4] + mr2.x * kernelsL[1*72+4*9+5] +
        bl2.x * kernelsL[1*72+4*9+6] + bc2.x * kernelsL[1*72+4*9+7] + br2.x * kernelsL[1*72+4*9+8] + 

        tl2.y * kernelsL[1*72+5*9+0] + tc2.y * kernelsL[1*72+5*9+1] + tr2.y * kernelsL[1*72+5*9+2] +
        ml2.y * kernelsL[1*72+5*9+3] + mc2.y * kernelsL[1*72+5*9+4] + mr2.y * kernelsL[1*72+5*9+5] +
        bl2.y * kernelsL[1*72+5*9+6] + bc2.y * kernelsL[1*72+5*9+7] + br2.y * kernelsL[1*72+5*9+8] + 

        tl2.z * kernelsL[1*72+6*9+0] + tc2.z * kernelsL[1*72+6*9+1] + tr2.z * kernelsL[1*72+6*9+2] +
        ml2.z * kernelsL[1*72+6*9+3] + mc2.z * kernelsL[1*72+6*9+4] + mr2.z * kernelsL[1*72+6*9+5] +
        bl2.z * kernelsL[1*72+6*9+6] + bc2.z * kernelsL[1*72+6*9+7] + br2.z * kernelsL[1*72+6*9+8] + 

        tl2.w * kernelsL[1*72+7*9+0] + tc2.w * kernelsL[1*72+7*9+1] + tr2.w * kernelsL[1*72+7*9+2] +
        ml2.w * kernelsL[1*72+7*9+3] + mc2.w * kernelsL[1*72+7*9+4] + mr2.w * kernelsL[1*72+7*9+5] +
        bl2.w * kernelsL[1*72+7*9+6] + bc2.w * kernelsL[1*72+7*9+7] + br2.w * kernelsL[1*72+7*9+8] + biasL[1]
        ,
        tl1.x * kernelsL[2*72+0*9+0] + tc1.x * kernelsL[2*72+0*9+1] + tr1.x * kernelsL[2*72+0*9+2] +
        ml1.x * kernelsL[2*72+0*9+3] + mc1.x * kernelsL[2*72+0*9+4] + mr1.x * kernelsL[2*72+0*9+5] +
        bl1.x * kernelsL[2*72+0*9+6] + bc1.x * kernelsL[2*72+0*9+7] + br1.x * kernelsL[2*72+0*9+8] + 

        tl1.y * kernelsL[2*72+1*9+0] + tc1.y * kernelsL[2*72+1*9+1] + tr1.y * kernelsL[2*72+1*9+2] +
        ml1.y * kernelsL[2*72+1*9+3] + mc1.y * kernelsL[2*72+1*9+4] + mr1.y * kernelsL[2*72+1*9+5] +
        bl1.y * kernelsL[2*72+1*9+6] + bc1.y * kernelsL[2*72+1*9+7] + br1.y * kernelsL[2*72+1*9+8] + 

        tl1.z * kernelsL[2*72+2*9+0] + tc1.z * kernelsL[2*72+2*9+1] + tr1.z * kernelsL[2*72+2*9+2] +
        ml1.z * kernelsL[2*72+2*9+3] + mc1.z * kernelsL[2*72+2*9+4] + mr1.z * kernelsL[2*72+2*9+5] +
        bl1.z * kernelsL[2*72+2*9+6] + bc1.z * kernelsL[2*72+2*9+7] + br1.z * kernelsL[2*72+2*9+8] + 

        tl1.w * kernelsL[2*72+3*9+0] + tc1.w * kernelsL[2*72+3*9+1] + tr1.w * kernelsL[2*72+3*9+2] +
        ml1.w * kernelsL[2*72+3*9+3] + mc1.w * kernelsL[2*72+3*9+4] + mr1.w * kernelsL[2*72+3*9+5] +
        bl1.w * kernelsL[2*72+3*9+6] + bc1.w * kernelsL[2*72+3*9+7] + br1.w * kernelsL[2*72+3*9+8] +

        tl2.x * kernelsL[2*72+4*9+0] + tc2.x * kernelsL[2*72+4*9+1] + tr2.x * kernelsL[2*72+4*9+2] +
        ml2.x * kernelsL[2*72+4*9+3] + mc2.x * kernelsL[2*72+4*9+4] + mr2.x * kernelsL[2*72+4*9+5] +
        bl2.x * kernelsL[2*72+4*9+6] + bc2.x * kernelsL[2*72+4*9+7] + br2.x * kernelsL[2*72+4*9+8] + 

        tl2.y * kernelsL[2*72+5*9+0] + tc2.y * kernelsL[2*72+5*9+1] + tr2.y * kernelsL[2*72+5*9+2] +
        ml2.y * kernelsL[2*72+5*9+3] + mc2.y * kernelsL[2*72+5*9+4] + mr2.y * kernelsL[2*72+5*9+5] +
        bl2.y * kernelsL[2*72+5*9+6] + bc2.y * kernelsL[2*72+5*9+7] + br2.y * kernelsL[2*72+5*9+8] + 

        tl2.z * kernelsL[2*72+6*9+0] + tc2.z * kernelsL[2*72+6*9+1] + tr2.z * kernelsL[2*72+6*9+2] +
        ml2.z * kernelsL[2*72+6*9+3] + mc2.z * kernelsL[2*72+6*9+4] + mr2.z * kernelsL[2*72+6*9+5] +
        bl2.z * kernelsL[2*72+6*9+6] + bc2.z * kernelsL[2*72+6*9+7] + br2.z * kernelsL[2*72+6*9+8] + 

        tl2.w * kernelsL[2*72+7*9+0] + tc2.w * kernelsL[2*72+7*9+1] + tr2.w * kernelsL[2*72+7*9+2] +
        ml2.w * kernelsL[2*72+7*9+3] + mc2.w * kernelsL[2*72+7*9+4] + mr2.w * kernelsL[2*72+7*9+5] +
        bl2.w * kernelsL[2*72+7*9+6] + bc2.w * kernelsL[2*72+7*9+7] + br2.w * kernelsL[2*72+7*9+8] + biasL[2]
        ,
        tl1.x * kernelsL[3*72+0*9+0] + tc1.x * kernelsL[3*72+0*9+1] + tr1.x * kernelsL[3*72+0*9+2] +
        ml1.x * kernelsL[3*72+0*9+3] + mc1.x * kernelsL[3*72+0*9+4] + mr1.x * kernelsL[3*72+0*9+5] +
        bl1.x * kernelsL[3*72+0*9+6] + bc1.x * kernelsL[3*72+0*9+7] + br1.x * kernelsL[3*72+0*9+8] + 

        tl1.y * kernelsL[3*72+1*9+0] + tc1.y * kernelsL[3*72+1*9+1] + tr1.y * kernelsL[3*72+1*9+2] +
        ml1.y * kernelsL[3*72+1*9+3] + mc1.y * kernelsL[3*72+1*9+4] + mr1.y * kernelsL[3*72+1*9+5] +
        bl1.y * kernelsL[3*72+1*9+6] + bc1.y * kernelsL[3*72+1*9+7] + br1.y * kernelsL[3*72+1*9+8] + 

        tl1.z * kernelsL[3*72+2*9+0] + tc1.z * kernelsL[3*72+2*9+1] + tr1.z * kernelsL[3*72+2*9+2] +
        ml1.z * kernelsL[3*72+2*9+3] + mc1.z * kernelsL[3*72+2*9+4] + mr1.z * kernelsL[3*72+2*9+5] +
        bl1.z * kernelsL[3*72+2*9+6] + bc1.z * kernelsL[3*72+2*9+7] + br1.z * kernelsL[3*72+2*9+8] + 

        tl1.w * kernelsL[3*72+3*9+0] + tc1.w * kernelsL[3*72+3*9+1] + tr1.w * kernelsL[3*72+3*9+2] +
        ml1.w * kernelsL[3*72+3*9+3] + mc1.w * kernelsL[3*72+3*9+4] + mr1.w * kernelsL[3*72+3*9+5] +
        bl1.w * kernelsL[3*72+3*9+6] + bc1.w * kernelsL[3*72+3*9+7] + br1.w * kernelsL[3*72+3*9+8] +

        tl2.x * kernelsL[3*72+4*9+0] + tc2.x * kernelsL[3*72+4*9+1] + tr2.x * kernelsL[3*72+4*9+2] +
        ml2.x * kernelsL[3*72+4*9+3] + mc2.x * kernelsL[3*72+4*9+4] + mr2.x * kernelsL[3*72+4*9+5] +
        bl2.x * kernelsL[3*72+4*9+6] + bc2.x * kernelsL[3*72+4*9+7] + br2.x * kernelsL[3*72+4*9+8] + 

        tl2.y * kernelsL[3*72+5*9+0] + tc2.y * kernelsL[3*72+5*9+1] + tr2.y * kernelsL[3*72+5*9+2] +
        ml2.y * kernelsL[3*72+5*9+3] + mc2.y * kernelsL[3*72+5*9+4] + mr2.y * kernelsL[3*72+5*9+5] +
        bl2.y * kernelsL[3*72+5*9+6] + bc2.y * kernelsL[3*72+5*9+7] + br2.y * kernelsL[3*72+5*9+8] + 

        tl2.z * kernelsL[3*72+6*9+0] + tc2.z * kernelsL[3*72+6*9+1] + tr2.z * kernelsL[3*72+6*9+2] +
        ml2.z * kernelsL[3*72+6*9+3] + mc2.z * kernelsL[3*72+6*9+4] + mr2.z * kernelsL[3*72+6*9+5] +
        bl2.z * kernelsL[3*72+6*9+6] + bc2.z * kernelsL[3*72+6*9+7] + br2.z * kernelsL[3*72+6*9+8] + 

        tl2.w * kernelsL[3*72+7*9+0] + tc2.w * kernelsL[3*72+7*9+1] + tr2.w * kernelsL[3*72+7*9+2] +
        ml2.w * kernelsL[3*72+7*9+3] + mc2.w * kernelsL[3*72+7*9+4] + mr2.w * kernelsL[3*72+7*9+5] +
        bl2.w * kernelsL[3*72+7*9+6] + bc2.w * kernelsL[3*72+7*9+7] + br2.w * kernelsL[3*72+7*9+8] + biasL[3]
    ));


    return c5678;
}

//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L5
//!BIND L2_1
//!BIND L2_2
//!SAVE L1_1
//!COMPONENTS 4

#define RELU(x) max(x, vec4(0.0f))

const float kernelsL[9 * 8 * 4] = float[9 * 8 * 4]
(
-6.7011e-03,  1.7398e-01,  1.4767e-01,
-1.9882e-02,  1.9286e-01,  4.8626e-02,
 1.1465e-01, -4.4017e-02, -1.9288e-01,
-7.5817e-02,  1.5598e-01,  1.2329e-01,
 3.4126e-03, -9.4884e-02, -4.2276e-02,
 3.9110e-02, -1.3477e-01, -4.4951e-02,
 6.0450e-02,  4.4656e-01,  3.8954e-01,
-2.1207e-01, -1.0600e-02, -5.6351e-01,
 1.8074e-01,  3.0797e-02, -4.0380e-01,
-1.0733e-01,  3.7228e-02,  9.7157e-02,
-7.5810e-03,  5.5605e-02, -9.1898e-02,
-1.4992e-01, -5.3206e-02, -1.9667e-01,
-1.6667e-01,  7.6091e-02,  1.7064e-01,
 2.5322e-01, -9.4636e-03, -2.7899e-01,
 4.2013e-02,  1.5693e-01,  3.1124e-01,
-2.1534e-02,  1.3915e-01, -2.8199e-01,
-2.9683e-03,  1.4445e-02, -1.5552e-01,
 3.4759e-02, -2.0321e-01, -1.1155e-01,
 3.6164e-02,  2.8664e-01,  2.3426e-01,
-1.2525e-01, -1.7195e-01, -5.2270e-02,
 3.8782e-02,  5.7734e-02,  2.1945e-01,
 1.0243e-01, -1.3159e-01, -1.7844e-01,
-6.0359e-02,  1.9125e-01,  3.3553e-01,
-1.0876e-01, -1.2149e-01, -5.7185e-01,
-2.0583e-02, -4.8168e-03, -7.1908e-02,
-2.3428e-02,  2.9902e-02,  1.0888e-02,
 3.6383e-02,  1.0052e-01,  2.8972e-02,
 1.1415e-03, -3.4518e-02, -9.0058e-02,
 7.3207e-03,  6.0961e-02,  7.5629e-02,
-4.5969e-02,  2.4314e-02,  6.7658e-02,
-1.3043e-01, -3.0343e-01, -2.0799e-01,
-4.6261e-02, -1.7650e-02, -7.2160e-02,
-2.6291e-02,  1.5707e-01,  9.5021e-02,
-4.1030e-02, -8.1977e-02, -3.0776e-02,
-3.0685e-02,  8.2163e-03,  4.0357e-02,
-6.9633e-02,  6.0690e-02,  1.5418e-02,
-1.2814e-01,  7.3968e-02, -3.3742e-03,
-1.5239e-01,  8.9941e-03,  1.7877e-01,
 2.1219e-01, -5.2057e-01, -2.2284e-01,
-3.4681e-02, -1.3594e-02,  1.6700e-01,
-7.7366e-02,  8.5138e-03, -4.3159e-02,
 4.0597e-02,  9.7247e-04, -3.4326e-01,
-2.1424e-01, -1.6489e-01, -4.3248e-02,
 1.5987e-01,  4.6235e-01,  2.6287e-01,
-1.2270e-02,  1.3165e-01,  5.3217e-02,
 7.2716e-02, -7.0677e-02, -1.7740e-01,
-6.2357e-02,  1.1932e-01,  1.5733e-01,
-1.0275e-01,  1.4966e-01,  4.8125e-02,
-4.7150e-02,  1.5516e-01,  6.9615e-02,
 6.1252e-02,  5.3859e-02,  1.7052e-01,
 3.1940e-02,  1.1842e-01,  4.2265e-02,
-4.9531e-02,  1.1519e-01,  9.8914e-02,
 1.3455e-01,  1.3177e-01, -2.7938e-03,
 1.1895e-01,  1.1377e-01,  6.1035e-02,
 8.0390e-02, -4.1028e-02,  3.7415e-03,
-1.0317e-01,  1.0279e-01, -6.5789e-03,
-2.3339e-02,  7.2741e-02,  4.1662e-02,
-7.4087e-02,  8.8531e-02, -4.9697e-02,
 4.6134e-02,  1.4300e-01,  1.1720e-01,
 3.8271e-03,  1.7108e-01, -2.4779e-02,
 6.9844e-02, -4.6467e-02, -9.1699e-02,
 5.5704e-02, -3.0312e-02, -7.8252e-03,
-4.3799e-02, -1.6623e-01, -2.3006e-02,
 4.9214e-02,  3.1528e-02,  3.3302e-02,
 3.1213e-02,  9.8880e-02, -1.1098e-01,
 4.5092e-02, -1.6922e-03, -5.1380e-02,
 7.6063e-02,  1.4159e-01,  4.1409e-02,
 8.0812e-02,  9.7569e-02,  4.1532e-02,
-1.1136e-01, -4.3686e-02, -1.4144e-01,
-9.7717e-02,  4.8239e-02,  5.3374e-02,
-1.1827e-01,  1.0008e-01,  8.6368e-02,
-6.2572e-02,  3.6484e-02, -6.3361e-02,
 4.1008e-03,  1.6709e-02,  4.0553e-02,
 2.2766e-02,  2.7241e-02,  5.1786e-02,
 1.3607e-02,  5.4638e-02,  6.9439e-02,
-2.4211e-02,  4.0065e-03, -1.9540e-03,
-9.5697e-03,  3.0503e-02,  3.5809e-02,
-4.3456e-02,  2.8959e-02,  4.2898e-02,
-1.5629e-02, -9.4347e-02,  7.2799e-02,
 2.3115e-01,  7.3449e-02,  6.9354e-02,
 1.6014e-01,  1.8878e-01, -2.2148e-02,
-4.9274e-02, -6.9233e-03,  1.0578e-02,
-4.3291e-02, -7.8361e-03,  1.6647e-02,
-5.6168e-02,  1.0317e-02,  3.1170e-02,
 1.2530e-01, -3.2398e-02, -6.5690e-02,
-2.5805e-01,  3.6079e-02,  3.5390e-02,
-1.7236e-01,  6.6798e-03,  4.8924e-02,
 1.3314e-01,  5.0646e-02, -3.4844e-02,
-1.2559e-01, -1.1774e-01,  1.2898e-01,
-7.7402e-02, -1.0703e-02, -2.6359e-01,
-3.8706e-02, -2.2082e-02,  2.7591e-03,
-8.2353e-02, -3.1941e-02, -1.1937e-01,
 2.9747e-02,  2.0041e-01, -5.1984e-02,
 1.7919e-01,  6.3603e-02, -5.5516e-02,
 1.0116e-01,  8.7370e-02, -8.6624e-02,
-8.4314e-02,  3.5997e-02,  2.1161e-01
);

const float biasL[4] = float[4]
(
 6.5694e-03, -2.2259e-01, -1.1226e-02, -8.0327e-02
);

vec4 hook()
{
    vec4 tl1 = L2_1_texOff(vec2(-1,-1));
    vec4 tc1 = L2_1_texOff(vec2(0,-1));
    vec4 tr1 = L2_1_texOff(vec2(1,-1));
    vec4 ml1 = L2_1_texOff(vec2(-1,0));
    vec4 mc1 = L2_1_texOff(vec2(0,0));
    vec4 mr1 = L2_1_texOff(vec2(1,0));
    vec4 bl1 = L2_1_texOff(vec2(-1,1));
    vec4 bc1 = L2_1_texOff(vec2(0,1));
    vec4 br1 = L2_1_texOff(vec2(1,1));

    vec4 tl2 = L2_2_texOff(vec2(-1,-1));
    vec4 tc2 = L2_2_texOff(vec2(0,-1));
    vec4 tr2 = L2_2_texOff(vec2(1,-1));
    vec4 ml2 = L2_2_texOff(vec2(-1,0));
    vec4 mc2 = L2_2_texOff(vec2(0,0));
    vec4 mr2 = L2_2_texOff(vec2(1,0));
    vec4 bl2 = L2_2_texOff(vec2(-1,1));
    vec4 bc2 = L2_2_texOff(vec2(0,1));
    vec4 br2 = L2_2_texOff(vec2(1,1));

    vec4 c1234 = RELU(vec4(
        tl1.x * kernelsL[0*72+0*9+0] + tc1.x * kernelsL[0*72+0*9+1] + tr1.x * kernelsL[0*72+0*9+2] +
        ml1.x * kernelsL[0*72+0*9+3] + mc1.x * kernelsL[0*72+0*9+4] + mr1.x * kernelsL[0*72+0*9+5] +
        bl1.x * kernelsL[0*72+0*9+6] + bc1.x * kernelsL[0*72+0*9+7] + br1.x * kernelsL[0*72+0*9+8] + 

        tl1.y * kernelsL[0*72+1*9+0] + tc1.y * kernelsL[0*72+1*9+1] + tr1.y * kernelsL[0*72+1*9+2] +
        ml1.y * kernelsL[0*72+1*9+3] + mc1.y * kernelsL[0*72+1*9+4] + mr1.y * kernelsL[0*72+1*9+5] +
        bl1.y * kernelsL[0*72+1*9+6] + bc1.y * kernelsL[0*72+1*9+7] + br1.y * kernelsL[0*72+1*9+8] + 

        tl1.z * kernelsL[0*72+2*9+0] + tc1.z * kernelsL[0*72+2*9+1] + tr1.z * kernelsL[0*72+2*9+2] +
        ml1.z * kernelsL[0*72+2*9+3] + mc1.z * kernelsL[0*72+2*9+4] + mr1.z * kernelsL[0*72+2*9+5] +
        bl1.z * kernelsL[0*72+2*9+6] + bc1.z * kernelsL[0*72+2*9+7] + br1.z * kernelsL[0*72+2*9+8] + 

        tl1.w * kernelsL[0*72+3*9+0] + tc1.w * kernelsL[0*72+3*9+1] + tr1.w * kernelsL[0*72+3*9+2] +
        ml1.w * kernelsL[0*72+3*9+3] + mc1.w * kernelsL[0*72+3*9+4] + mr1.w * kernelsL[0*72+3*9+5] +
        bl1.w * kernelsL[0*72+3*9+6] + bc1.w * kernelsL[0*72+3*9+7] + br1.w * kernelsL[0*72+3*9+8] +

        tl2.x * kernelsL[0*72+4*9+0] + tc2.x * kernelsL[0*72+4*9+1] + tr2.x * kernelsL[0*72+4*9+2] +
        ml2.x * kernelsL[0*72+4*9+3] + mc2.x * kernelsL[0*72+4*9+4] + mr2.x * kernelsL[0*72+4*9+5] +
        bl2.x * kernelsL[0*72+4*9+6] + bc2.x * kernelsL[0*72+4*9+7] + br2.x * kernelsL[0*72+4*9+8] + 

        tl2.y * kernelsL[0*72+5*9+0] + tc2.y * kernelsL[0*72+5*9+1] + tr2.y * kernelsL[0*72+5*9+2] +
        ml2.y * kernelsL[0*72+5*9+3] + mc2.y * kernelsL[0*72+5*9+4] + mr2.y * kernelsL[0*72+5*9+5] +
        bl2.y * kernelsL[0*72+5*9+6] + bc2.y * kernelsL[0*72+5*9+7] + br2.y * kernelsL[0*72+5*9+8] + 

        tl2.z * kernelsL[0*72+6*9+0] + tc2.z * kernelsL[0*72+6*9+1] + tr2.z * kernelsL[0*72+6*9+2] +
        ml2.z * kernelsL[0*72+6*9+3] + mc2.z * kernelsL[0*72+6*9+4] + mr2.z * kernelsL[0*72+6*9+5] +
        bl2.z * kernelsL[0*72+6*9+6] + bc2.z * kernelsL[0*72+6*9+7] + br2.z * kernelsL[0*72+6*9+8] + 

        tl2.w * kernelsL[0*72+7*9+0] + tc2.w * kernelsL[0*72+7*9+1] + tr2.w * kernelsL[0*72+7*9+2] +
        ml2.w * kernelsL[0*72+7*9+3] + mc2.w * kernelsL[0*72+7*9+4] + mr2.w * kernelsL[0*72+7*9+5] +
        bl2.w * kernelsL[0*72+7*9+6] + bc2.w * kernelsL[0*72+7*9+7] + br2.w * kernelsL[0*72+7*9+8] + biasL[0]
        ,
        tl1.x * kernelsL[1*72+0*9+0] + tc1.x * kernelsL[1*72+0*9+1] + tr1.x * kernelsL[1*72+0*9+2] +
        ml1.x * kernelsL[1*72+0*9+3] + mc1.x * kernelsL[1*72+0*9+4] + mr1.x * kernelsL[1*72+0*9+5] +
        bl1.x * kernelsL[1*72+0*9+6] + bc1.x * kernelsL[1*72+0*9+7] + br1.x * kernelsL[1*72+0*9+8] + 

        tl1.y * kernelsL[1*72+1*9+0] + tc1.y * kernelsL[1*72+1*9+1] + tr1.y * kernelsL[1*72+1*9+2] +
        ml1.y * kernelsL[1*72+1*9+3] + mc1.y * kernelsL[1*72+1*9+4] + mr1.y * kernelsL[1*72+1*9+5] +
        bl1.y * kernelsL[1*72+1*9+6] + bc1.y * kernelsL[1*72+1*9+7] + br1.y * kernelsL[1*72+1*9+8] + 

        tl1.z * kernelsL[1*72+2*9+0] + tc1.z * kernelsL[1*72+2*9+1] + tr1.z * kernelsL[1*72+2*9+2] +
        ml1.z * kernelsL[1*72+2*9+3] + mc1.z * kernelsL[1*72+2*9+4] + mr1.z * kernelsL[1*72+2*9+5] +
        bl1.z * kernelsL[1*72+2*9+6] + bc1.z * kernelsL[1*72+2*9+7] + br1.z * kernelsL[1*72+2*9+8] + 

        tl1.w * kernelsL[1*72+3*9+0] + tc1.w * kernelsL[1*72+3*9+1] + tr1.w * kernelsL[1*72+3*9+2] +
        ml1.w * kernelsL[1*72+3*9+3] + mc1.w * kernelsL[1*72+3*9+4] + mr1.w * kernelsL[1*72+3*9+5] +
        bl1.w * kernelsL[1*72+3*9+6] + bc1.w * kernelsL[1*72+3*9+7] + br1.w * kernelsL[1*72+3*9+8] +

        tl2.x * kernelsL[1*72+4*9+0] + tc2.x * kernelsL[1*72+4*9+1] + tr2.x * kernelsL[1*72+4*9+2] +
        ml2.x * kernelsL[1*72+4*9+3] + mc2.x * kernelsL[1*72+4*9+4] + mr2.x * kernelsL[1*72+4*9+5] +
        bl2.x * kernelsL[1*72+4*9+6] + bc2.x * kernelsL[1*72+4*9+7] + br2.x * kernelsL[1*72+4*9+8] + 

        tl2.y * kernelsL[1*72+5*9+0] + tc2.y * kernelsL[1*72+5*9+1] + tr2.y * kernelsL[1*72+5*9+2] +
        ml2.y * kernelsL[1*72+5*9+3] + mc2.y * kernelsL[1*72+5*9+4] + mr2.y * kernelsL[1*72+5*9+5] +
        bl2.y * kernelsL[1*72+5*9+6] + bc2.y * kernelsL[1*72+5*9+7] + br2.y * kernelsL[1*72+5*9+8] + 

        tl2.z * kernelsL[1*72+6*9+0] + tc2.z * kernelsL[1*72+6*9+1] + tr2.z * kernelsL[1*72+6*9+2] +
        ml2.z * kernelsL[1*72+6*9+3] + mc2.z * kernelsL[1*72+6*9+4] + mr2.z * kernelsL[1*72+6*9+5] +
        bl2.z * kernelsL[1*72+6*9+6] + bc2.z * kernelsL[1*72+6*9+7] + br2.z * kernelsL[1*72+6*9+8] + 

        tl2.w * kernelsL[1*72+7*9+0] + tc2.w * kernelsL[1*72+7*9+1] + tr2.w * kernelsL[1*72+7*9+2] +
        ml2.w * kernelsL[1*72+7*9+3] + mc2.w * kernelsL[1*72+7*9+4] + mr2.w * kernelsL[1*72+7*9+5] +
        bl2.w * kernelsL[1*72+7*9+6] + bc2.w * kernelsL[1*72+7*9+7] + br2.w * kernelsL[1*72+7*9+8] + biasL[1]
        ,
        tl1.x * kernelsL[2*72+0*9+0] + tc1.x * kernelsL[2*72+0*9+1] + tr1.x * kernelsL[2*72+0*9+2] +
        ml1.x * kernelsL[2*72+0*9+3] + mc1.x * kernelsL[2*72+0*9+4] + mr1.x * kernelsL[2*72+0*9+5] +
        bl1.x * kernelsL[2*72+0*9+6] + bc1.x * kernelsL[2*72+0*9+7] + br1.x * kernelsL[2*72+0*9+8] + 

        tl1.y * kernelsL[2*72+1*9+0] + tc1.y * kernelsL[2*72+1*9+1] + tr1.y * kernelsL[2*72+1*9+2] +
        ml1.y * kernelsL[2*72+1*9+3] + mc1.y * kernelsL[2*72+1*9+4] + mr1.y * kernelsL[2*72+1*9+5] +
        bl1.y * kernelsL[2*72+1*9+6] + bc1.y * kernelsL[2*72+1*9+7] + br1.y * kernelsL[2*72+1*9+8] + 

        tl1.z * kernelsL[2*72+2*9+0] + tc1.z * kernelsL[2*72+2*9+1] + tr1.z * kernelsL[2*72+2*9+2] +
        ml1.z * kernelsL[2*72+2*9+3] + mc1.z * kernelsL[2*72+2*9+4] + mr1.z * kernelsL[2*72+2*9+5] +
        bl1.z * kernelsL[2*72+2*9+6] + bc1.z * kernelsL[2*72+2*9+7] + br1.z * kernelsL[2*72+2*9+8] + 

        tl1.w * kernelsL[2*72+3*9+0] + tc1.w * kernelsL[2*72+3*9+1] + tr1.w * kernelsL[2*72+3*9+2] +
        ml1.w * kernelsL[2*72+3*9+3] + mc1.w * kernelsL[2*72+3*9+4] + mr1.w * kernelsL[2*72+3*9+5] +
        bl1.w * kernelsL[2*72+3*9+6] + bc1.w * kernelsL[2*72+3*9+7] + br1.w * kernelsL[2*72+3*9+8] +

        tl2.x * kernelsL[2*72+4*9+0] + tc2.x * kernelsL[2*72+4*9+1] + tr2.x * kernelsL[2*72+4*9+2] +
        ml2.x * kernelsL[2*72+4*9+3] + mc2.x * kernelsL[2*72+4*9+4] + mr2.x * kernelsL[2*72+4*9+5] +
        bl2.x * kernelsL[2*72+4*9+6] + bc2.x * kernelsL[2*72+4*9+7] + br2.x * kernelsL[2*72+4*9+8] + 

        tl2.y * kernelsL[2*72+5*9+0] + tc2.y * kernelsL[2*72+5*9+1] + tr2.y * kernelsL[2*72+5*9+2] +
        ml2.y * kernelsL[2*72+5*9+3] + mc2.y * kernelsL[2*72+5*9+4] + mr2.y * kernelsL[2*72+5*9+5] +
        bl2.y * kernelsL[2*72+5*9+6] + bc2.y * kernelsL[2*72+5*9+7] + br2.y * kernelsL[2*72+5*9+8] + 

        tl2.z * kernelsL[2*72+6*9+0] + tc2.z * kernelsL[2*72+6*9+1] + tr2.z * kernelsL[2*72+6*9+2] +
        ml2.z * kernelsL[2*72+6*9+3] + mc2.z * kernelsL[2*72+6*9+4] + mr2.z * kernelsL[2*72+6*9+5] +
        bl2.z * kernelsL[2*72+6*9+6] + bc2.z * kernelsL[2*72+6*9+7] + br2.z * kernelsL[2*72+6*9+8] + 

        tl2.w * kernelsL[2*72+7*9+0] + tc2.w * kernelsL[2*72+7*9+1] + tr2.w * kernelsL[2*72+7*9+2] +
        ml2.w * kernelsL[2*72+7*9+3] + mc2.w * kernelsL[2*72+7*9+4] + mr2.w * kernelsL[2*72+7*9+5] +
        bl2.w * kernelsL[2*72+7*9+6] + bc2.w * kernelsL[2*72+7*9+7] + br2.w * kernelsL[2*72+7*9+8] + biasL[2]
        ,
        tl1.x * kernelsL[3*72+0*9+0] + tc1.x * kernelsL[3*72+0*9+1] + tr1.x * kernelsL[3*72+0*9+2] +
        ml1.x * kernelsL[3*72+0*9+3] + mc1.x * kernelsL[3*72+0*9+4] + mr1.x * kernelsL[3*72+0*9+5] +
        bl1.x * kernelsL[3*72+0*9+6] + bc1.x * kernelsL[3*72+0*9+7] + br1.x * kernelsL[3*72+0*9+8] + 

        tl1.y * kernelsL[3*72+1*9+0] + tc1.y * kernelsL[3*72+1*9+1] + tr1.y * kernelsL[3*72+1*9+2] +
        ml1.y * kernelsL[3*72+1*9+3] + mc1.y * kernelsL[3*72+1*9+4] + mr1.y * kernelsL[3*72+1*9+5] +
        bl1.y * kernelsL[3*72+1*9+6] + bc1.y * kernelsL[3*72+1*9+7] + br1.y * kernelsL[3*72+1*9+8] + 

        tl1.z * kernelsL[3*72+2*9+0] + tc1.z * kernelsL[3*72+2*9+1] + tr1.z * kernelsL[3*72+2*9+2] +
        ml1.z * kernelsL[3*72+2*9+3] + mc1.z * kernelsL[3*72+2*9+4] + mr1.z * kernelsL[3*72+2*9+5] +
        bl1.z * kernelsL[3*72+2*9+6] + bc1.z * kernelsL[3*72+2*9+7] + br1.z * kernelsL[3*72+2*9+8] + 

        tl1.w * kernelsL[3*72+3*9+0] + tc1.w * kernelsL[3*72+3*9+1] + tr1.w * kernelsL[3*72+3*9+2] +
        ml1.w * kernelsL[3*72+3*9+3] + mc1.w * kernelsL[3*72+3*9+4] + mr1.w * kernelsL[3*72+3*9+5] +
        bl1.w * kernelsL[3*72+3*9+6] + bc1.w * kernelsL[3*72+3*9+7] + br1.w * kernelsL[3*72+3*9+8] +

        tl2.x * kernelsL[3*72+4*9+0] + tc2.x * kernelsL[3*72+4*9+1] + tr2.x * kernelsL[3*72+4*9+2] +
        ml2.x * kernelsL[3*72+4*9+3] + mc2.x * kernelsL[3*72+4*9+4] + mr2.x * kernelsL[3*72+4*9+5] +
        bl2.x * kernelsL[3*72+4*9+6] + bc2.x * kernelsL[3*72+4*9+7] + br2.x * kernelsL[3*72+4*9+8] + 

        tl2.y * kernelsL[3*72+5*9+0] + tc2.y * kernelsL[3*72+5*9+1] + tr2.y * kernelsL[3*72+5*9+2] +
        ml2.y * kernelsL[3*72+5*9+3] + mc2.y * kernelsL[3*72+5*9+4] + mr2.y * kernelsL[3*72+5*9+5] +
        bl2.y * kernelsL[3*72+5*9+6] + bc2.y * kernelsL[3*72+5*9+7] + br2.y * kernelsL[3*72+5*9+8] + 

        tl2.z * kernelsL[3*72+6*9+0] + tc2.z * kernelsL[3*72+6*9+1] + tr2.z * kernelsL[3*72+6*9+2] +
        ml2.z * kernelsL[3*72+6*9+3] + mc2.z * kernelsL[3*72+6*9+4] + mr2.z * kernelsL[3*72+6*9+5] +
        bl2.z * kernelsL[3*72+6*9+6] + bc2.z * kernelsL[3*72+6*9+7] + br2.z * kernelsL[3*72+6*9+8] + 

        tl2.w * kernelsL[3*72+7*9+0] + tc2.w * kernelsL[3*72+7*9+1] + tr2.w * kernelsL[3*72+7*9+2] +
        ml2.w * kernelsL[3*72+7*9+3] + mc2.w * kernelsL[3*72+7*9+4] + mr2.w * kernelsL[3*72+7*9+5] +
        bl2.w * kernelsL[3*72+7*9+6] + bc2.w * kernelsL[3*72+7*9+7] + br2.w * kernelsL[3*72+7*9+8] + biasL[3]
    ));


    return c1234;
}


//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L5
//!BIND L2_1
//!BIND L2_2
//!SAVE L1_2
//!COMPONENTS 4

#define RELU(x) max(x, vec4(0.0f))

const float kernelsL[9 * 8 * 4] = float[9 * 8 * 4]
(
 1.0902e-39,  9.3514e-40,  9.3074e-40,
 9.8377e-40,  1.1299e-39,  8.2024e-40,
 1.2062e-39,  1.0405e-39,  1.0284e-39,
-5.7829e-40, -6.7489e-40, -6.3814e-40,
-6.8460e-40, -7.9377e-40, -7.6449e-40,
-4.7632e-40, -5.6022e-40, -5.2053e-40,
 1.8459e-39,  2.1036e-39,  2.1848e-39,
 2.0535e-39,  2.3728e-39,  2.4416e-39,
 1.7027e-39,  2.0249e-39,  2.0833e-39,
 9.1594e-40,  8.0493e-40,  7.7836e-40,
 7.5889e-40,  6.3026e-40,  9.3384e-40,
 9.6987e-40,  1.1273e-39,  8.1906e-40,
-7.9046e-39, -7.2328e-39, -7.1040e-39,
-7.9046e-39, -7.1862e-39, -7.4931e-39,
-6.5243e-39, -7.1117e-39, -6.9941e-39,
 1.3577e-39,  3.5945e-40, -3.6833e-40,
 1.3768e-39,  6.9779e-40, -7.5180e-40,
 5.7295e-40, -6.0767e-41, -1.3085e-39,
 7.7960e-39,  7.8579e-39,  7.4482e-39,
 7.4224e-39,  7.5791e-39,  7.4378e-39,
 6.5819e-39,  6.7271e-39,  6.6281e-39,
-1.6535e-39, -7.7817e-40, -8.5918e-40,
-2.0861e-39, -1.3658e-39, -1.0560e-39,
-3.4360e-39, -2.6878e-39, -2.6477e-39,
 4.6460e-02,  1.1676e-01, -5.9846e-02,
 8.6467e-03, -1.1287e-02,  7.0129e-02,
-1.1277e-01,  1.0321e-02, -1.9567e-02,
 1.2145e-01, -7.1995e-02, -1.3615e-02,
 9.7877e-02,  6.6061e-02,  1.0272e-02,
 1.1391e-01,  5.6974e-02,  9.7472e-02,
-3.3605e-02,  6.1751e-02, -4.3004e-02,
-5.1040e-02, -3.8798e-02, -7.1736e-02,
-1.0179e-02,  8.5964e-02, -8.1435e-04,
 2.5149e-02,  7.1990e-02,  8.1534e-02,
 6.3133e-02,  5.8643e-02,  4.6756e-02,
-5.3580e-03,  3.4411e-02,  5.2957e-03,
 1.0652e-01, -6.6035e-02,  8.5754e-02,
 3.2919e-01, -1.5958e-02,  2.1694e-03,
-9.0943e-02, -2.1920e-02,  2.9706e-02,
 4.7986e-02,  1.7105e-02, -5.7711e-02,
-4.2066e-03,  6.5668e-02, -1.6617e-01,
 1.0057e-02, -2.0108e-03, -1.5499e-01,
 6.7941e-02,  1.7352e-01,  4.9498e-02,
 6.2013e-02,  9.6180e-02, -2.9861e-03,
-1.2482e-02,  9.5709e-03, -8.7913e-02,
-8.6954e-02,  9.9646e-03,  8.0050e-02,
-4.4157e-02, -6.3008e-03,  4.0645e-02,
-7.9624e-02,  1.0856e-01, -4.5341e-04,
 7.1085e-02,  5.7002e-02,  1.1673e-02,
-5.1378e-02, -2.3945e-03, -5.9532e-02,
 3.4998e-02, -3.6019e-02,  1.0428e-02,
 5.9774e-03,  5.4993e-03,  2.4306e-02,
-5.9813e-03,  4.4999e-02,  7.4744e-02,
-3.0773e-02, -3.6835e-02,  5.8396e-04,
-3.8644e-01,  2.4563e-01,  1.2436e-01,
-3.2986e-01, -1.1044e-01,  2.0753e-01,
-1.3621e-01, -1.3544e-01,  5.8882e-02,
 8.8837e-02,  5.7460e-02, -3.0960e-02,
-1.2598e-03,  3.9124e-02, -5.3322e-02,
-4.4227e-02, -3.8000e-02, -3.2677e-02,
 1.5675e-01,  1.0808e-01,  1.1024e-01,
 5.4468e-01, -5.9268e-01,  1.0088e-01,
 8.2360e-02,  1.9646e-01,  6.4799e-03,
 1.6357e-01,  6.8273e-02, -1.2051e-01,
 4.9511e-02,  4.7334e-01, -4.8876e-02,
-1.3130e-01, -5.1568e-03,  1.0088e-01,
-5.8971e-02,  2.5775e-01,  9.0169e-02,
-3.0461e-01, -3.2353e-02, -2.0293e-01,
 1.3897e-02,  1.4249e-01, -5.8661e-02,
-1.3624e-01, -5.3026e-02,  3.1038e-03,
-5.6211e-01, -2.8375e-01, -1.2524e-01,
-2.3813e-01, -2.2439e-02, -4.4082e-02,
 9.9066e-02, -7.1735e-02,  2.2345e-02,
-1.4791e-02,  1.3225e-01,  8.9460e-02,
-4.8986e-02, -3.2296e-02, -4.7474e-02,
 6.5865e-02, -8.0697e-02, -6.8475e-02,
-7.6845e-02,  1.1568e-01,  3.7443e-03,
 1.0448e-01, -3.3206e-03,  5.4523e-02,
 5.5741e-02,  5.0917e-02,  1.0209e-01,
-9.6729e-02,  7.8876e-02, -4.9550e-02,
-3.8926e-02,  7.1163e-02,  8.9436e-02,
-1.4001e-03, -9.4980e-02, -7.7747e-02,
 9.4335e-02,  1.1605e-01,  9.5715e-02,
 1.7951e-02,  4.3177e-03, -5.6937e-02,
 4.4558e-02, -5.2562e-02,  4.0652e-02,
 1.8058e-01, -1.0763e-01,  4.8927e-02,
-5.2569e-03, -1.3437e-01,  2.8578e-02,
 1.3592e-02, -3.9346e-02,  1.0003e-01,
 1.8091e-01,  7.2687e-03, -3.7241e-02,
 6.0438e-02,  5.7872e-02,  7.3778e-02,
 1.2411e-02,  4.1856e-02, -2.8892e-02,
 3.2884e-02,  6.9072e-02, -5.9363e-02,
-1.7112e-01, -9.9734e-02, -7.3417e-02,
-8.9623e-02,  4.5292e-02, -1.6635e-01,
-3.1895e-02,  1.4284e-01,  2.0752e-01,
 2.3383e-02, -1.3490e-02,  5.1593e-03
);

const float biasL[4] = float[4]
(
-1.0615e-36, 1.0402e-02,  7.6246e-03, -6.5940e-02
);

vec4 hook()
{
    vec4 tl1 = L2_1_texOff(vec2(-1,-1));
    vec4 tc1 = L2_1_texOff(vec2(0,-1));
    vec4 tr1 = L2_1_texOff(vec2(1,-1));
    vec4 ml1 = L2_1_texOff(vec2(-1,0));
    vec4 mc1 = L2_1_texOff(vec2(0,0));
    vec4 mr1 = L2_1_texOff(vec2(1,0));
    vec4 bl1 = L2_1_texOff(vec2(-1,1));
    vec4 bc1 = L2_1_texOff(vec2(0,1));
    vec4 br1 = L2_1_texOff(vec2(1,1));

    vec4 tl2 = L2_2_texOff(vec2(-1,-1));
    vec4 tc2 = L2_2_texOff(vec2(0,-1));
    vec4 tr2 = L2_2_texOff(vec2(1,-1));
    vec4 ml2 = L2_2_texOff(vec2(-1,0));
    vec4 mc2 = L2_2_texOff(vec2(0,0));
    vec4 mr2 = L2_2_texOff(vec2(1,0));
    vec4 bl2 = L2_2_texOff(vec2(-1,1));
    vec4 bc2 = L2_2_texOff(vec2(0,1));
    vec4 br2 = L2_2_texOff(vec2(1,1));

    vec4 c5678 = RELU(vec4(
        tl1.x * kernelsL[0*72+0*9+0] + tc1.x * kernelsL[0*72+0*9+1] + tr1.x * kernelsL[0*72+0*9+2] +
        ml1.x * kernelsL[0*72+0*9+3] + mc1.x * kernelsL[0*72+0*9+4] + mr1.x * kernelsL[0*72+0*9+5] +
        bl1.x * kernelsL[0*72+0*9+6] + bc1.x * kernelsL[0*72+0*9+7] + br1.x * kernelsL[0*72+0*9+8] + 

        tl1.y * kernelsL[0*72+1*9+0] + tc1.y * kernelsL[0*72+1*9+1] + tr1.y * kernelsL[0*72+1*9+2] +
        ml1.y * kernelsL[0*72+1*9+3] + mc1.y * kernelsL[0*72+1*9+4] + mr1.y * kernelsL[0*72+1*9+5] +
        bl1.y * kernelsL[0*72+1*9+6] + bc1.y * kernelsL[0*72+1*9+7] + br1.y * kernelsL[0*72+1*9+8] + 

        tl1.z * kernelsL[0*72+2*9+0] + tc1.z * kernelsL[0*72+2*9+1] + tr1.z * kernelsL[0*72+2*9+2] +
        ml1.z * kernelsL[0*72+2*9+3] + mc1.z * kernelsL[0*72+2*9+4] + mr1.z * kernelsL[0*72+2*9+5] +
        bl1.z * kernelsL[0*72+2*9+6] + bc1.z * kernelsL[0*72+2*9+7] + br1.z * kernelsL[0*72+2*9+8] + 

        tl1.w * kernelsL[0*72+3*9+0] + tc1.w * kernelsL[0*72+3*9+1] + tr1.w * kernelsL[0*72+3*9+2] +
        ml1.w * kernelsL[0*72+3*9+3] + mc1.w * kernelsL[0*72+3*9+4] + mr1.w * kernelsL[0*72+3*9+5] +
        bl1.w * kernelsL[0*72+3*9+6] + bc1.w * kernelsL[0*72+3*9+7] + br1.w * kernelsL[0*72+3*9+8] +

        tl2.x * kernelsL[0*72+4*9+0] + tc2.x * kernelsL[0*72+4*9+1] + tr2.x * kernelsL[0*72+4*9+2] +
        ml2.x * kernelsL[0*72+4*9+3] + mc2.x * kernelsL[0*72+4*9+4] + mr2.x * kernelsL[0*72+4*9+5] +
        bl2.x * kernelsL[0*72+4*9+6] + bc2.x * kernelsL[0*72+4*9+7] + br2.x * kernelsL[0*72+4*9+8] + 

        tl2.y * kernelsL[0*72+5*9+0] + tc2.y * kernelsL[0*72+5*9+1] + tr2.y * kernelsL[0*72+5*9+2] +
        ml2.y * kernelsL[0*72+5*9+3] + mc2.y * kernelsL[0*72+5*9+4] + mr2.y * kernelsL[0*72+5*9+5] +
        bl2.y * kernelsL[0*72+5*9+6] + bc2.y * kernelsL[0*72+5*9+7] + br2.y * kernelsL[0*72+5*9+8] + 

        tl2.z * kernelsL[0*72+6*9+0] + tc2.z * kernelsL[0*72+6*9+1] + tr2.z * kernelsL[0*72+6*9+2] +
        ml2.z * kernelsL[0*72+6*9+3] + mc2.z * kernelsL[0*72+6*9+4] + mr2.z * kernelsL[0*72+6*9+5] +
        bl2.z * kernelsL[0*72+6*9+6] + bc2.z * kernelsL[0*72+6*9+7] + br2.z * kernelsL[0*72+6*9+8] + 

        tl2.w * kernelsL[0*72+7*9+0] + tc2.w * kernelsL[0*72+7*9+1] + tr2.w * kernelsL[0*72+7*9+2] +
        ml2.w * kernelsL[0*72+7*9+3] + mc2.w * kernelsL[0*72+7*9+4] + mr2.w * kernelsL[0*72+7*9+5] +
        bl2.w * kernelsL[0*72+7*9+6] + bc2.w * kernelsL[0*72+7*9+7] + br2.w * kernelsL[0*72+7*9+8] + biasL[0]
        ,
        tl1.x * kernelsL[1*72+0*9+0] + tc1.x * kernelsL[1*72+0*9+1] + tr1.x * kernelsL[1*72+0*9+2] +
        ml1.x * kernelsL[1*72+0*9+3] + mc1.x * kernelsL[1*72+0*9+4] + mr1.x * kernelsL[1*72+0*9+5] +
        bl1.x * kernelsL[1*72+0*9+6] + bc1.x * kernelsL[1*72+0*9+7] + br1.x * kernelsL[1*72+0*9+8] + 

        tl1.y * kernelsL[1*72+1*9+0] + tc1.y * kernelsL[1*72+1*9+1] + tr1.y * kernelsL[1*72+1*9+2] +
        ml1.y * kernelsL[1*72+1*9+3] + mc1.y * kernelsL[1*72+1*9+4] + mr1.y * kernelsL[1*72+1*9+5] +
        bl1.y * kernelsL[1*72+1*9+6] + bc1.y * kernelsL[1*72+1*9+7] + br1.y * kernelsL[1*72+1*9+8] + 

        tl1.z * kernelsL[1*72+2*9+0] + tc1.z * kernelsL[1*72+2*9+1] + tr1.z * kernelsL[1*72+2*9+2] +
        ml1.z * kernelsL[1*72+2*9+3] + mc1.z * kernelsL[1*72+2*9+4] + mr1.z * kernelsL[1*72+2*9+5] +
        bl1.z * kernelsL[1*72+2*9+6] + bc1.z * kernelsL[1*72+2*9+7] + br1.z * kernelsL[1*72+2*9+8] + 

        tl1.w * kernelsL[1*72+3*9+0] + tc1.w * kernelsL[1*72+3*9+1] + tr1.w * kernelsL[1*72+3*9+2] +
        ml1.w * kernelsL[1*72+3*9+3] + mc1.w * kernelsL[1*72+3*9+4] + mr1.w * kernelsL[1*72+3*9+5] +
        bl1.w * kernelsL[1*72+3*9+6] + bc1.w * kernelsL[1*72+3*9+7] + br1.w * kernelsL[1*72+3*9+8] +

        tl2.x * kernelsL[1*72+4*9+0] + tc2.x * kernelsL[1*72+4*9+1] + tr2.x * kernelsL[1*72+4*9+2] +
        ml2.x * kernelsL[1*72+4*9+3] + mc2.x * kernelsL[1*72+4*9+4] + mr2.x * kernelsL[1*72+4*9+5] +
        bl2.x * kernelsL[1*72+4*9+6] + bc2.x * kernelsL[1*72+4*9+7] + br2.x * kernelsL[1*72+4*9+8] + 

        tl2.y * kernelsL[1*72+5*9+0] + tc2.y * kernelsL[1*72+5*9+1] + tr2.y * kernelsL[1*72+5*9+2] +
        ml2.y * kernelsL[1*72+5*9+3] + mc2.y * kernelsL[1*72+5*9+4] + mr2.y * kernelsL[1*72+5*9+5] +
        bl2.y * kernelsL[1*72+5*9+6] + bc2.y * kernelsL[1*72+5*9+7] + br2.y * kernelsL[1*72+5*9+8] + 

        tl2.z * kernelsL[1*72+6*9+0] + tc2.z * kernelsL[1*72+6*9+1] + tr2.z * kernelsL[1*72+6*9+2] +
        ml2.z * kernelsL[1*72+6*9+3] + mc2.z * kernelsL[1*72+6*9+4] + mr2.z * kernelsL[1*72+6*9+5] +
        bl2.z * kernelsL[1*72+6*9+6] + bc2.z * kernelsL[1*72+6*9+7] + br2.z * kernelsL[1*72+6*9+8] + 

        tl2.w * kernelsL[1*72+7*9+0] + tc2.w * kernelsL[1*72+7*9+1] + tr2.w * kernelsL[1*72+7*9+2] +
        ml2.w * kernelsL[1*72+7*9+3] + mc2.w * kernelsL[1*72+7*9+4] + mr2.w * kernelsL[1*72+7*9+5] +
        bl2.w * kernelsL[1*72+7*9+6] + bc2.w * kernelsL[1*72+7*9+7] + br2.w * kernelsL[1*72+7*9+8] + biasL[1]
        ,
        tl1.x * kernelsL[2*72+0*9+0] + tc1.x * kernelsL[2*72+0*9+1] + tr1.x * kernelsL[2*72+0*9+2] +
        ml1.x * kernelsL[2*72+0*9+3] + mc1.x * kernelsL[2*72+0*9+4] + mr1.x * kernelsL[2*72+0*9+5] +
        bl1.x * kernelsL[2*72+0*9+6] + bc1.x * kernelsL[2*72+0*9+7] + br1.x * kernelsL[2*72+0*9+8] + 

        tl1.y * kernelsL[2*72+1*9+0] + tc1.y * kernelsL[2*72+1*9+1] + tr1.y * kernelsL[2*72+1*9+2] +
        ml1.y * kernelsL[2*72+1*9+3] + mc1.y * kernelsL[2*72+1*9+4] + mr1.y * kernelsL[2*72+1*9+5] +
        bl1.y * kernelsL[2*72+1*9+6] + bc1.y * kernelsL[2*72+1*9+7] + br1.y * kernelsL[2*72+1*9+8] + 

        tl1.z * kernelsL[2*72+2*9+0] + tc1.z * kernelsL[2*72+2*9+1] + tr1.z * kernelsL[2*72+2*9+2] +
        ml1.z * kernelsL[2*72+2*9+3] + mc1.z * kernelsL[2*72+2*9+4] + mr1.z * kernelsL[2*72+2*9+5] +
        bl1.z * kernelsL[2*72+2*9+6] + bc1.z * kernelsL[2*72+2*9+7] + br1.z * kernelsL[2*72+2*9+8] + 

        tl1.w * kernelsL[2*72+3*9+0] + tc1.w * kernelsL[2*72+3*9+1] + tr1.w * kernelsL[2*72+3*9+2] +
        ml1.w * kernelsL[2*72+3*9+3] + mc1.w * kernelsL[2*72+3*9+4] + mr1.w * kernelsL[2*72+3*9+5] +
        bl1.w * kernelsL[2*72+3*9+6] + bc1.w * kernelsL[2*72+3*9+7] + br1.w * kernelsL[2*72+3*9+8] +

        tl2.x * kernelsL[2*72+4*9+0] + tc2.x * kernelsL[2*72+4*9+1] + tr2.x * kernelsL[2*72+4*9+2] +
        ml2.x * kernelsL[2*72+4*9+3] + mc2.x * kernelsL[2*72+4*9+4] + mr2.x * kernelsL[2*72+4*9+5] +
        bl2.x * kernelsL[2*72+4*9+6] + bc2.x * kernelsL[2*72+4*9+7] + br2.x * kernelsL[2*72+4*9+8] + 

        tl2.y * kernelsL[2*72+5*9+0] + tc2.y * kernelsL[2*72+5*9+1] + tr2.y * kernelsL[2*72+5*9+2] +
        ml2.y * kernelsL[2*72+5*9+3] + mc2.y * kernelsL[2*72+5*9+4] + mr2.y * kernelsL[2*72+5*9+5] +
        bl2.y * kernelsL[2*72+5*9+6] + bc2.y * kernelsL[2*72+5*9+7] + br2.y * kernelsL[2*72+5*9+8] + 

        tl2.z * kernelsL[2*72+6*9+0] + tc2.z * kernelsL[2*72+6*9+1] + tr2.z * kernelsL[2*72+6*9+2] +
        ml2.z * kernelsL[2*72+6*9+3] + mc2.z * kernelsL[2*72+6*9+4] + mr2.z * kernelsL[2*72+6*9+5] +
        bl2.z * kernelsL[2*72+6*9+6] + bc2.z * kernelsL[2*72+6*9+7] + br2.z * kernelsL[2*72+6*9+8] + 

        tl2.w * kernelsL[2*72+7*9+0] + tc2.w * kernelsL[2*72+7*9+1] + tr2.w * kernelsL[2*72+7*9+2] +
        ml2.w * kernelsL[2*72+7*9+3] + mc2.w * kernelsL[2*72+7*9+4] + mr2.w * kernelsL[2*72+7*9+5] +
        bl2.w * kernelsL[2*72+7*9+6] + bc2.w * kernelsL[2*72+7*9+7] + br2.w * kernelsL[2*72+7*9+8] + biasL[2]
        ,
        tl1.x * kernelsL[3*72+0*9+0] + tc1.x * kernelsL[3*72+0*9+1] + tr1.x * kernelsL[3*72+0*9+2] +
        ml1.x * kernelsL[3*72+0*9+3] + mc1.x * kernelsL[3*72+0*9+4] + mr1.x * kernelsL[3*72+0*9+5] +
        bl1.x * kernelsL[3*72+0*9+6] + bc1.x * kernelsL[3*72+0*9+7] + br1.x * kernelsL[3*72+0*9+8] + 

        tl1.y * kernelsL[3*72+1*9+0] + tc1.y * kernelsL[3*72+1*9+1] + tr1.y * kernelsL[3*72+1*9+2] +
        ml1.y * kernelsL[3*72+1*9+3] + mc1.y * kernelsL[3*72+1*9+4] + mr1.y * kernelsL[3*72+1*9+5] +
        bl1.y * kernelsL[3*72+1*9+6] + bc1.y * kernelsL[3*72+1*9+7] + br1.y * kernelsL[3*72+1*9+8] + 

        tl1.z * kernelsL[3*72+2*9+0] + tc1.z * kernelsL[3*72+2*9+1] + tr1.z * kernelsL[3*72+2*9+2] +
        ml1.z * kernelsL[3*72+2*9+3] + mc1.z * kernelsL[3*72+2*9+4] + mr1.z * kernelsL[3*72+2*9+5] +
        bl1.z * kernelsL[3*72+2*9+6] + bc1.z * kernelsL[3*72+2*9+7] + br1.z * kernelsL[3*72+2*9+8] + 

        tl1.w * kernelsL[3*72+3*9+0] + tc1.w * kernelsL[3*72+3*9+1] + tr1.w * kernelsL[3*72+3*9+2] +
        ml1.w * kernelsL[3*72+3*9+3] + mc1.w * kernelsL[3*72+3*9+4] + mr1.w * kernelsL[3*72+3*9+5] +
        bl1.w * kernelsL[3*72+3*9+6] + bc1.w * kernelsL[3*72+3*9+7] + br1.w * kernelsL[3*72+3*9+8] +

        tl2.x * kernelsL[3*72+4*9+0] + tc2.x * kernelsL[3*72+4*9+1] + tr2.x * kernelsL[3*72+4*9+2] +
        ml2.x * kernelsL[3*72+4*9+3] + mc2.x * kernelsL[3*72+4*9+4] + mr2.x * kernelsL[3*72+4*9+5] +
        bl2.x * kernelsL[3*72+4*9+6] + bc2.x * kernelsL[3*72+4*9+7] + br2.x * kernelsL[3*72+4*9+8] + 

        tl2.y * kernelsL[3*72+5*9+0] + tc2.y * kernelsL[3*72+5*9+1] + tr2.y * kernelsL[3*72+5*9+2] +
        ml2.y * kernelsL[3*72+5*9+3] + mc2.y * kernelsL[3*72+5*9+4] + mr2.y * kernelsL[3*72+5*9+5] +
        bl2.y * kernelsL[3*72+5*9+6] + bc2.y * kernelsL[3*72+5*9+7] + br2.y * kernelsL[3*72+5*9+8] + 

        tl2.z * kernelsL[3*72+6*9+0] + tc2.z * kernelsL[3*72+6*9+1] + tr2.z * kernelsL[3*72+6*9+2] +
        ml2.z * kernelsL[3*72+6*9+3] + mc2.z * kernelsL[3*72+6*9+4] + mr2.z * kernelsL[3*72+6*9+5] +
        bl2.z * kernelsL[3*72+6*9+6] + bc2.z * kernelsL[3*72+6*9+7] + br2.z * kernelsL[3*72+6*9+8] + 

        tl2.w * kernelsL[3*72+7*9+0] + tc2.w * kernelsL[3*72+7*9+1] + tr2.w * kernelsL[3*72+7*9+2] +
        ml2.w * kernelsL[3*72+7*9+3] + mc2.w * kernelsL[3*72+7*9+4] + mr2.w * kernelsL[3*72+7*9+5] +
        bl2.w * kernelsL[3*72+7*9+6] + bc2.w * kernelsL[3*72+7*9+7] + br2.w * kernelsL[3*72+7*9+8] + biasL[3]
    ));


    return c5678;
}

//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L6
//!BIND L1_1
//!BIND L1_2
//!SAVE L2_1
//!COMPONENTS 4

#define RELU(x) max(x, vec4(0.0f))

const float kernelsL[9 * 8 * 4] = float[9 * 8 * 4]
(
 5.8708e-01,  2.6026e-01,  8.8379e-02,
 3.1818e-01,  7.0055e-03,  1.1652e-01,
 1.1719e-01,  8.7711e-02, -1.1687e-02,
 7.5741e-02, -3.7970e-01,  1.6001e-01,
 1.0739e-01,  3.1735e-01,  2.0061e-01,
 8.6719e-02,  8.5111e-02, -3.9354e-02,
-9.9512e-02, -9.1524e-02, -9.7984e-02,
 5.6333e-02, -1.5928e-01,  1.1998e-03,
 2.7488e-02,  2.8168e-02,  1.3768e-01,
 5.9686e-02,  2.8931e-01, -1.7131e-02,
 1.6391e-01,  3.3748e-01,  1.2296e-01,
 8.9242e-02,  1.4761e-01,  1.7187e-01,
-2.6352e-39, -4.0703e-39, -5.1751e-39,
-2.5214e-39, -3.9666e-39, -4.6282e-39,
-2.4635e-39, -3.6734e-39, -4.3359e-39,
-7.1654e-02,  7.9691e-03, -1.0219e-01,
-5.5684e-02, -1.3065e-01, -1.9106e-02,
 1.0561e-01,  5.9054e-02, -2.1279e-02,
-1.8840e-02,  1.6690e-01,  3.8050e-01,
 6.2779e-02, -1.2124e-01,  5.0304e-01,
 2.1870e-02,  1.7631e-01,  1.4858e-01,
 1.4614e-01, -1.1767e-01, -3.9155e-02,
 1.2963e-01, -4.6753e-02,  1.3848e-01,
-8.2292e-02,  2.1908e-01,  6.2794e-02,
-3.2625e-01, -8.8528e-03, -6.5603e-03,
 5.4245e-02,  2.7983e-01,  2.1608e-01,
 8.5890e-02,  1.0955e-01, -1.1606e-01,
 9.7435e-02,  1.5911e-01,  6.7285e-02,
 3.9570e-02,  1.9333e-01, -1.5531e-02,
-2.3475e-01, -2.5006e-02,  2.8106e-02,
 6.8740e-03,  1.3261e-01, -3.8563e-02,
 8.8758e-02, -4.2225e-02,  4.7042e-02,
 5.6284e-02, -2.8303e-02,  3.4532e-03,
-4.0265e-02, -3.0645e-02, -5.2059e-02,
-4.6196e-02, -2.4868e-02, -3.3257e-02,
-3.7208e-02, -2.4100e-03, -7.1959e-04,
 6.4237e-39,  6.1438e-39,  6.5434e-39,
 6.1596e-39,  6.1608e-39,  6.3157e-39,
 6.4263e-39,  6.4625e-39,  6.5877e-39,
 1.1092e-01, -4.4784e-02,  9.1292e-02,
 9.2900e-02,  1.2459e-01, -7.1447e-02,
 2.6158e-02, -5.0219e-02, -5.6136e-02,
-5.8603e-02,  2.9323e-02, -2.4230e-01,
-9.4921e-02,  1.9103e-01,  1.1670e-01,
 1.2022e-02,  6.2830e-02,  3.0393e-01,
 3.3819e-02,  1.0040e-01,  8.2600e-02,
-8.7604e-02,  7.0641e-02, -1.0132e-01,
-9.9371e-02,  8.9363e-02, -1.0703e-01,
 4.4603e-01,  7.9636e-03,  1.8834e-01,
 1.1859e-01,  4.0760e-01,  9.6841e-02,
-1.1735e-01,  2.3993e-01, -7.7916e-02,
 6.3481e-02, -1.4958e-01,  1.1554e-02,
 5.2668e-02,  3.4379e-01,  8.3536e-03,
-5.5403e-02,  1.1655e-01, -7.5022e-02,
-8.2992e-02, -7.0322e-02, -1.0078e-01,
-1.4516e-02, -1.6558e-02,  6.6806e-02,
-6.7454e-04, -5.7525e-02,  1.5772e-01,
 1.6446e-01, -1.1897e-02, -8.3387e-02,
 7.1339e-02,  1.6254e-01,  1.6963e-01,
 1.2630e-02,  5.7933e-02,  8.4686e-02,
-5.6318e-39, -6.1837e-39, -6.1661e-39,
-5.9923e-39, -6.2371e-39, -6.4922e-39,
-6.4206e-39, -6.6092e-39, -7.1603e-39,
 4.6507e-02, -4.5924e-02, -7.3838e-02,
-3.3012e-02,  5.1295e-02, -7.4884e-02,
 7.5389e-02,  1.2002e-01,  3.9442e-03,
 9.9461e-02,  1.9607e-01,  1.4896e-01,
-1.1191e-02,  1.8352e-01,  2.6778e-01,
 8.0977e-02,  1.0885e-01,  2.5331e-01,
 3.1503e-02, -3.0004e-01, -6.9114e-02,
 2.0705e-01, -2.0978e-02,  1.5154e-01,
 6.3033e-02, -1.5721e-01,  5.1067e-02,
-1.1220e-02,  1.5315e-01,  4.5277e-03,
 3.3250e-01,  1.4207e-01,  1.3469e-01,
 5.2996e-01, -2.5803e-01, -4.5525e-02,
 3.9807e-02, -1.7088e-01, -1.2414e-01,
 2.1564e-01, -2.9160e-01, -1.8796e-01,
 1.5482e-02,  2.7005e-01,  8.2446e-02,
 5.4906e-02, -1.0507e-01, -8.0069e-02,
-4.5729e-03, -2.0621e-02,  5.0088e-02,
 2.5479e-02,  9.5924e-02,  8.3813e-02,
 4.7833e-02, -2.6191e-01,  3.3483e-02,
 6.1653e-02,  7.1940e-03, -1.3578e-01,
 1.7662e-01, -2.8194e-02, -2.7509e-02,
-1.9419e-39, -2.4904e-39, -2.7567e-39,
-2.9896e-39, -3.2700e-39, -3.6336e-39,
-3.8942e-39, -4.2028e-39, -4.5229e-39,
-1.6839e-02, -9.4421e-02, -3.0147e-02,
-6.5974e-02, -1.6716e-02,  5.0672e-02,
-7.9841e-02, -4.7086e-03,  5.0016e-02,
 1.8223e-04,  3.3984e-03,  5.1965e-02,
-7.3512e-02, -5.6604e-03, -1.1630e-01,
-1.0767e-01,  3.2261e-02, -2.0044e-01,
 1.0995e-01,  4.3581e-02, -3.9397e-02,
-1.4476e-02, -2.3087e-02,  2.6423e-03,
 1.2047e-02,  1.2084e-01,  1.8563e-01
);

const float biasL[4] = float[4]
(
 5.0711e-02,  7.1911e-02,  2.5293e-02, -1.5608e-02
);

vec4 hook()
{
    vec4 tl1 = L1_1_texOff(vec2(-1,-1));
    vec4 tc1 = L1_1_texOff(vec2(0,-1));
    vec4 tr1 = L1_1_texOff(vec2(1,-1));
    vec4 ml1 = L1_1_texOff(vec2(-1,0));
    vec4 mc1 = L1_1_texOff(vec2(0,0));
    vec4 mr1 = L1_1_texOff(vec2(1,0));
    vec4 bl1 = L1_1_texOff(vec2(-1,1));
    vec4 bc1 = L1_1_texOff(vec2(0,1));
    vec4 br1 = L1_1_texOff(vec2(1,1));

    vec4 tl2 = L1_2_texOff(vec2(-1,-1));
    vec4 tc2 = L1_2_texOff(vec2(0,-1));
    vec4 tr2 = L1_2_texOff(vec2(1,-1));
    vec4 ml2 = L1_2_texOff(vec2(-1,0));
    vec4 mc2 = L1_2_texOff(vec2(0,0));
    vec4 mr2 = L1_2_texOff(vec2(1,0));
    vec4 bl2 = L1_2_texOff(vec2(-1,1));
    vec4 bc2 = L1_2_texOff(vec2(0,1));
    vec4 br2 = L1_2_texOff(vec2(1,1));

    vec4 c1234 = RELU(vec4(
        tl1.x * kernelsL[0*72+0*9+0] + tc1.x * kernelsL[0*72+0*9+1] + tr1.x * kernelsL[0*72+0*9+2] +
        ml1.x * kernelsL[0*72+0*9+3] + mc1.x * kernelsL[0*72+0*9+4] + mr1.x * kernelsL[0*72+0*9+5] +
        bl1.x * kernelsL[0*72+0*9+6] + bc1.x * kernelsL[0*72+0*9+7] + br1.x * kernelsL[0*72+0*9+8] + 

        tl1.y * kernelsL[0*72+1*9+0] + tc1.y * kernelsL[0*72+1*9+1] + tr1.y * kernelsL[0*72+1*9+2] +
        ml1.y * kernelsL[0*72+1*9+3] + mc1.y * kernelsL[0*72+1*9+4] + mr1.y * kernelsL[0*72+1*9+5] +
        bl1.y * kernelsL[0*72+1*9+6] + bc1.y * kernelsL[0*72+1*9+7] + br1.y * kernelsL[0*72+1*9+8] + 

        tl1.z * kernelsL[0*72+2*9+0] + tc1.z * kernelsL[0*72+2*9+1] + tr1.z * kernelsL[0*72+2*9+2] +
        ml1.z * kernelsL[0*72+2*9+3] + mc1.z * kernelsL[0*72+2*9+4] + mr1.z * kernelsL[0*72+2*9+5] +
        bl1.z * kernelsL[0*72+2*9+6] + bc1.z * kernelsL[0*72+2*9+7] + br1.z * kernelsL[0*72+2*9+8] + 

        tl1.w * kernelsL[0*72+3*9+0] + tc1.w * kernelsL[0*72+3*9+1] + tr1.w * kernelsL[0*72+3*9+2] +
        ml1.w * kernelsL[0*72+3*9+3] + mc1.w * kernelsL[0*72+3*9+4] + mr1.w * kernelsL[0*72+3*9+5] +
        bl1.w * kernelsL[0*72+3*9+6] + bc1.w * kernelsL[0*72+3*9+7] + br1.w * kernelsL[0*72+3*9+8] +

        tl2.x * kernelsL[0*72+4*9+0] + tc2.x * kernelsL[0*72+4*9+1] + tr2.x * kernelsL[0*72+4*9+2] +
        ml2.x * kernelsL[0*72+4*9+3] + mc2.x * kernelsL[0*72+4*9+4] + mr2.x * kernelsL[0*72+4*9+5] +
        bl2.x * kernelsL[0*72+4*9+6] + bc2.x * kernelsL[0*72+4*9+7] + br2.x * kernelsL[0*72+4*9+8] + 

        tl2.y * kernelsL[0*72+5*9+0] + tc2.y * kernelsL[0*72+5*9+1] + tr2.y * kernelsL[0*72+5*9+2] +
        ml2.y * kernelsL[0*72+5*9+3] + mc2.y * kernelsL[0*72+5*9+4] + mr2.y * kernelsL[0*72+5*9+5] +
        bl2.y * kernelsL[0*72+5*9+6] + bc2.y * kernelsL[0*72+5*9+7] + br2.y * kernelsL[0*72+5*9+8] + 

        tl2.z * kernelsL[0*72+6*9+0] + tc2.z * kernelsL[0*72+6*9+1] + tr2.z * kernelsL[0*72+6*9+2] +
        ml2.z * kernelsL[0*72+6*9+3] + mc2.z * kernelsL[0*72+6*9+4] + mr2.z * kernelsL[0*72+6*9+5] +
        bl2.z * kernelsL[0*72+6*9+6] + bc2.z * kernelsL[0*72+6*9+7] + br2.z * kernelsL[0*72+6*9+8] + 

        tl2.w * kernelsL[0*72+7*9+0] + tc2.w * kernelsL[0*72+7*9+1] + tr2.w * kernelsL[0*72+7*9+2] +
        ml2.w * kernelsL[0*72+7*9+3] + mc2.w * kernelsL[0*72+7*9+4] + mr2.w * kernelsL[0*72+7*9+5] +
        bl2.w * kernelsL[0*72+7*9+6] + bc2.w * kernelsL[0*72+7*9+7] + br2.w * kernelsL[0*72+7*9+8] + biasL[0]
        ,
        tl1.x * kernelsL[1*72+0*9+0] + tc1.x * kernelsL[1*72+0*9+1] + tr1.x * kernelsL[1*72+0*9+2] +
        ml1.x * kernelsL[1*72+0*9+3] + mc1.x * kernelsL[1*72+0*9+4] + mr1.x * kernelsL[1*72+0*9+5] +
        bl1.x * kernelsL[1*72+0*9+6] + bc1.x * kernelsL[1*72+0*9+7] + br1.x * kernelsL[1*72+0*9+8] + 

        tl1.y * kernelsL[1*72+1*9+0] + tc1.y * kernelsL[1*72+1*9+1] + tr1.y * kernelsL[1*72+1*9+2] +
        ml1.y * kernelsL[1*72+1*9+3] + mc1.y * kernelsL[1*72+1*9+4] + mr1.y * kernelsL[1*72+1*9+5] +
        bl1.y * kernelsL[1*72+1*9+6] + bc1.y * kernelsL[1*72+1*9+7] + br1.y * kernelsL[1*72+1*9+8] + 

        tl1.z * kernelsL[1*72+2*9+0] + tc1.z * kernelsL[1*72+2*9+1] + tr1.z * kernelsL[1*72+2*9+2] +
        ml1.z * kernelsL[1*72+2*9+3] + mc1.z * kernelsL[1*72+2*9+4] + mr1.z * kernelsL[1*72+2*9+5] +
        bl1.z * kernelsL[1*72+2*9+6] + bc1.z * kernelsL[1*72+2*9+7] + br1.z * kernelsL[1*72+2*9+8] + 

        tl1.w * kernelsL[1*72+3*9+0] + tc1.w * kernelsL[1*72+3*9+1] + tr1.w * kernelsL[1*72+3*9+2] +
        ml1.w * kernelsL[1*72+3*9+3] + mc1.w * kernelsL[1*72+3*9+4] + mr1.w * kernelsL[1*72+3*9+5] +
        bl1.w * kernelsL[1*72+3*9+6] + bc1.w * kernelsL[1*72+3*9+7] + br1.w * kernelsL[1*72+3*9+8] +

        tl2.x * kernelsL[1*72+4*9+0] + tc2.x * kernelsL[1*72+4*9+1] + tr2.x * kernelsL[1*72+4*9+2] +
        ml2.x * kernelsL[1*72+4*9+3] + mc2.x * kernelsL[1*72+4*9+4] + mr2.x * kernelsL[1*72+4*9+5] +
        bl2.x * kernelsL[1*72+4*9+6] + bc2.x * kernelsL[1*72+4*9+7] + br2.x * kernelsL[1*72+4*9+8] + 

        tl2.y * kernelsL[1*72+5*9+0] + tc2.y * kernelsL[1*72+5*9+1] + tr2.y * kernelsL[1*72+5*9+2] +
        ml2.y * kernelsL[1*72+5*9+3] + mc2.y * kernelsL[1*72+5*9+4] + mr2.y * kernelsL[1*72+5*9+5] +
        bl2.y * kernelsL[1*72+5*9+6] + bc2.y * kernelsL[1*72+5*9+7] + br2.y * kernelsL[1*72+5*9+8] + 

        tl2.z * kernelsL[1*72+6*9+0] + tc2.z * kernelsL[1*72+6*9+1] + tr2.z * kernelsL[1*72+6*9+2] +
        ml2.z * kernelsL[1*72+6*9+3] + mc2.z * kernelsL[1*72+6*9+4] + mr2.z * kernelsL[1*72+6*9+5] +
        bl2.z * kernelsL[1*72+6*9+6] + bc2.z * kernelsL[1*72+6*9+7] + br2.z * kernelsL[1*72+6*9+8] + 

        tl2.w * kernelsL[1*72+7*9+0] + tc2.w * kernelsL[1*72+7*9+1] + tr2.w * kernelsL[1*72+7*9+2] +
        ml2.w * kernelsL[1*72+7*9+3] + mc2.w * kernelsL[1*72+7*9+4] + mr2.w * kernelsL[1*72+7*9+5] +
        bl2.w * kernelsL[1*72+7*9+6] + bc2.w * kernelsL[1*72+7*9+7] + br2.w * kernelsL[1*72+7*9+8] + biasL[1]
        ,
        tl1.x * kernelsL[2*72+0*9+0] + tc1.x * kernelsL[2*72+0*9+1] + tr1.x * kernelsL[2*72+0*9+2] +
        ml1.x * kernelsL[2*72+0*9+3] + mc1.x * kernelsL[2*72+0*9+4] + mr1.x * kernelsL[2*72+0*9+5] +
        bl1.x * kernelsL[2*72+0*9+6] + bc1.x * kernelsL[2*72+0*9+7] + br1.x * kernelsL[2*72+0*9+8] + 

        tl1.y * kernelsL[2*72+1*9+0] + tc1.y * kernelsL[2*72+1*9+1] + tr1.y * kernelsL[2*72+1*9+2] +
        ml1.y * kernelsL[2*72+1*9+3] + mc1.y * kernelsL[2*72+1*9+4] + mr1.y * kernelsL[2*72+1*9+5] +
        bl1.y * kernelsL[2*72+1*9+6] + bc1.y * kernelsL[2*72+1*9+7] + br1.y * kernelsL[2*72+1*9+8] + 

        tl1.z * kernelsL[2*72+2*9+0] + tc1.z * kernelsL[2*72+2*9+1] + tr1.z * kernelsL[2*72+2*9+2] +
        ml1.z * kernelsL[2*72+2*9+3] + mc1.z * kernelsL[2*72+2*9+4] + mr1.z * kernelsL[2*72+2*9+5] +
        bl1.z * kernelsL[2*72+2*9+6] + bc1.z * kernelsL[2*72+2*9+7] + br1.z * kernelsL[2*72+2*9+8] + 

        tl1.w * kernelsL[2*72+3*9+0] + tc1.w * kernelsL[2*72+3*9+1] + tr1.w * kernelsL[2*72+3*9+2] +
        ml1.w * kernelsL[2*72+3*9+3] + mc1.w * kernelsL[2*72+3*9+4] + mr1.w * kernelsL[2*72+3*9+5] +
        bl1.w * kernelsL[2*72+3*9+6] + bc1.w * kernelsL[2*72+3*9+7] + br1.w * kernelsL[2*72+3*9+8] +

        tl2.x * kernelsL[2*72+4*9+0] + tc2.x * kernelsL[2*72+4*9+1] + tr2.x * kernelsL[2*72+4*9+2] +
        ml2.x * kernelsL[2*72+4*9+3] + mc2.x * kernelsL[2*72+4*9+4] + mr2.x * kernelsL[2*72+4*9+5] +
        bl2.x * kernelsL[2*72+4*9+6] + bc2.x * kernelsL[2*72+4*9+7] + br2.x * kernelsL[2*72+4*9+8] + 

        tl2.y * kernelsL[2*72+5*9+0] + tc2.y * kernelsL[2*72+5*9+1] + tr2.y * kernelsL[2*72+5*9+2] +
        ml2.y * kernelsL[2*72+5*9+3] + mc2.y * kernelsL[2*72+5*9+4] + mr2.y * kernelsL[2*72+5*9+5] +
        bl2.y * kernelsL[2*72+5*9+6] + bc2.y * kernelsL[2*72+5*9+7] + br2.y * kernelsL[2*72+5*9+8] + 

        tl2.z * kernelsL[2*72+6*9+0] + tc2.z * kernelsL[2*72+6*9+1] + tr2.z * kernelsL[2*72+6*9+2] +
        ml2.z * kernelsL[2*72+6*9+3] + mc2.z * kernelsL[2*72+6*9+4] + mr2.z * kernelsL[2*72+6*9+5] +
        bl2.z * kernelsL[2*72+6*9+6] + bc2.z * kernelsL[2*72+6*9+7] + br2.z * kernelsL[2*72+6*9+8] + 

        tl2.w * kernelsL[2*72+7*9+0] + tc2.w * kernelsL[2*72+7*9+1] + tr2.w * kernelsL[2*72+7*9+2] +
        ml2.w * kernelsL[2*72+7*9+3] + mc2.w * kernelsL[2*72+7*9+4] + mr2.w * kernelsL[2*72+7*9+5] +
        bl2.w * kernelsL[2*72+7*9+6] + bc2.w * kernelsL[2*72+7*9+7] + br2.w * kernelsL[2*72+7*9+8] + biasL[2]
        ,
        tl1.x * kernelsL[3*72+0*9+0] + tc1.x * kernelsL[3*72+0*9+1] + tr1.x * kernelsL[3*72+0*9+2] +
        ml1.x * kernelsL[3*72+0*9+3] + mc1.x * kernelsL[3*72+0*9+4] + mr1.x * kernelsL[3*72+0*9+5] +
        bl1.x * kernelsL[3*72+0*9+6] + bc1.x * kernelsL[3*72+0*9+7] + br1.x * kernelsL[3*72+0*9+8] + 

        tl1.y * kernelsL[3*72+1*9+0] + tc1.y * kernelsL[3*72+1*9+1] + tr1.y * kernelsL[3*72+1*9+2] +
        ml1.y * kernelsL[3*72+1*9+3] + mc1.y * kernelsL[3*72+1*9+4] + mr1.y * kernelsL[3*72+1*9+5] +
        bl1.y * kernelsL[3*72+1*9+6] + bc1.y * kernelsL[3*72+1*9+7] + br1.y * kernelsL[3*72+1*9+8] + 

        tl1.z * kernelsL[3*72+2*9+0] + tc1.z * kernelsL[3*72+2*9+1] + tr1.z * kernelsL[3*72+2*9+2] +
        ml1.z * kernelsL[3*72+2*9+3] + mc1.z * kernelsL[3*72+2*9+4] + mr1.z * kernelsL[3*72+2*9+5] +
        bl1.z * kernelsL[3*72+2*9+6] + bc1.z * kernelsL[3*72+2*9+7] + br1.z * kernelsL[3*72+2*9+8] + 

        tl1.w * kernelsL[3*72+3*9+0] + tc1.w * kernelsL[3*72+3*9+1] + tr1.w * kernelsL[3*72+3*9+2] +
        ml1.w * kernelsL[3*72+3*9+3] + mc1.w * kernelsL[3*72+3*9+4] + mr1.w * kernelsL[3*72+3*9+5] +
        bl1.w * kernelsL[3*72+3*9+6] + bc1.w * kernelsL[3*72+3*9+7] + br1.w * kernelsL[3*72+3*9+8] +

        tl2.x * kernelsL[3*72+4*9+0] + tc2.x * kernelsL[3*72+4*9+1] + tr2.x * kernelsL[3*72+4*9+2] +
        ml2.x * kernelsL[3*72+4*9+3] + mc2.x * kernelsL[3*72+4*9+4] + mr2.x * kernelsL[3*72+4*9+5] +
        bl2.x * kernelsL[3*72+4*9+6] + bc2.x * kernelsL[3*72+4*9+7] + br2.x * kernelsL[3*72+4*9+8] + 

        tl2.y * kernelsL[3*72+5*9+0] + tc2.y * kernelsL[3*72+5*9+1] + tr2.y * kernelsL[3*72+5*9+2] +
        ml2.y * kernelsL[3*72+5*9+3] + mc2.y * kernelsL[3*72+5*9+4] + mr2.y * kernelsL[3*72+5*9+5] +
        bl2.y * kernelsL[3*72+5*9+6] + bc2.y * kernelsL[3*72+5*9+7] + br2.y * kernelsL[3*72+5*9+8] + 

        tl2.z * kernelsL[3*72+6*9+0] + tc2.z * kernelsL[3*72+6*9+1] + tr2.z * kernelsL[3*72+6*9+2] +
        ml2.z * kernelsL[3*72+6*9+3] + mc2.z * kernelsL[3*72+6*9+4] + mr2.z * kernelsL[3*72+6*9+5] +
        bl2.z * kernelsL[3*72+6*9+6] + bc2.z * kernelsL[3*72+6*9+7] + br2.z * kernelsL[3*72+6*9+8] + 

        tl2.w * kernelsL[3*72+7*9+0] + tc2.w * kernelsL[3*72+7*9+1] + tr2.w * kernelsL[3*72+7*9+2] +
        ml2.w * kernelsL[3*72+7*9+3] + mc2.w * kernelsL[3*72+7*9+4] + mr2.w * kernelsL[3*72+7*9+5] +
        bl2.w * kernelsL[3*72+7*9+6] + bc2.w * kernelsL[3*72+7*9+7] + br2.w * kernelsL[3*72+7*9+8] + biasL[3]
    ));


    return c1234;
}


//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L6
//!BIND L1_1
//!BIND L1_2
//!SAVE L2_2
//!COMPONENTS 4

#define RELU(x) max(x, vec4(0.0f))

const float kernelsL[9 * 8 * 4] = float[9 * 8 * 4]
(
-2.8497e-01, -2.5353e-01,  1.0933e-01,
 8.8974e-03,  1.3315e-01,  1.9153e-01,
 2.0427e-02, -8.9900e-02,  2.2363e-02,
 2.8575e-02,  1.6351e-01,  1.1876e-01,
-2.7438e-02, -1.0816e-03, -5.5680e-02,
 5.1369e-02, -2.0575e-02,  4.5232e-02,
 9.4988e-02,  2.5418e-02,  8.9888e-02,
 9.6631e-02,  1.5828e-01,  1.1577e-01,
-2.9665e-02,  3.2035e-02,  1.4428e-01,
 7.4352e-03,  2.4917e-03,  4.2713e-03,
 1.2534e-02,  2.1314e-02,  1.5963e-02,
 2.2920e-03,  2.1864e-02,  2.2921e-02,
 7.1089e-40,  5.3581e-40,  4.5922e-40,
 6.2492e-40,  4.6365e-40,  4.5466e-40,
 9.2740e-40,  7.7219e-40,  7.4187e-40,
-7.0909e-02,  1.1127e-01, -8.8953e-02,
-5.0537e-04,  4.5664e-05,  1.3829e-02,
 7.4380e-02,  1.3900e-03,  4.0345e-02,
 5.7173e-02,  8.7514e-02, -3.9945e-01,
 4.4116e-02,  1.4148e-01, -2.7578e-02,
-1.2133e-02,  1.9647e-01, -2.6767e-02,
 8.5870e-02, -1.3723e-02,  1.3408e-02,
 7.9471e-03,  7.8321e-02,  5.1118e-02,
-8.3660e-02, -7.1584e-02,  2.7423e-02,
-5.5651e-39, -3.2350e-39,  4.7534e-39,
-4.8581e-39, -5.8010e-39,  6.3268e-39,
-3.4016e-39,  6.2313e-39,  5.7413e-39,
-3.0708e-39,  6.0155e-39, -6.3317e-39,
-3.1054e-39, -5.5914e-39, -6.4181e-39,
-1.3636e-40, -6.0343e-39, -6.2034e-39,
 1.0108e-39, -2.5283e-39, -8.6098e-40,
 1.0088e-39, -2.3042e-39, -8.2029e-40,
 1.2802e-39, -3.7761e-39, -4.6451e-40,
 1.4160e-39,  7.3869e-40,  1.3275e-39,
 1.2560e-39,  1.0078e-39,  1.2296e-39,
-2.4490e-39,  8.6071e-40, -2.4510e-39,
 2.1753e-39, -2.0576e-39, -2.1365e-39,
 2.0157e-39,  2.0755e-39,  1.9439e-39,
 2.0998e-39,  2.0732e-39,  2.1072e-39,
-1.1289e-39, -1.6132e-39,  4.8117e-40,
 1.2029e-39, -1.3112e-39,  6.4761e-40,
 1.4958e-39, -9.2719e-40,  8.9526e-40,
 3.6032e-39, -4.9803e-39, -2.4410e-39,
-1.6429e-39, -4.9602e-39, -5.9626e-39,
-1.6627e-39, -4.9809e-39, -5.6258e-39,
 1.6619e-39,  1.7856e-39,  5.1822e-39,
 1.5443e-39,  1.4215e-39,  6.1830e-39,
 1.4242e-39, -1.7895e-39,  5.2206e-39,
-2.4764e-01, -2.8696e-01, -5.7562e-03,
 1.9255e-01,  5.1335e-02, -1.4512e-01,
-1.1017e-02, -3.6505e-02, -1.1773e-01,
 5.8651e-02, -1.9354e-02,  2.1595e-02,
-3.5114e-03,  1.8335e-01,  4.0043e-02,
 1.0579e-01, -6.3055e-02,  2.6981e-02,
-1.4351e-02, -1.5029e-02, -9.7792e-02,
 4.6718e-02,  3.8673e-02, -2.3410e-02,
-2.8942e-03, -8.4898e-03, -3.3613e-02,
 2.0298e-01,  9.7218e-02,  1.5052e-01,
 3.2108e-01,  2.6568e-01,  1.3809e-03,
 1.0008e-01,  6.9262e-02, -4.7810e-02,
 4.1291e-39,  4.3762e-39,  4.2724e-39,
 4.5864e-39,  4.7827e-39,  4.8821e-39,
 4.5529e-39,  4.6921e-39,  4.7519e-39,
 9.1246e-03, -1.8136e-02, -5.8517e-03,
 9.1080e-03,  4.2591e-02, -1.5604e-02,
-3.6270e-02,  5.9184e-02,  2.3189e-02,
 4.2636e-02,  3.6600e-01,  4.7134e-01,
 3.6666e-02,  4.3565e-01,  2.1105e-01,
-5.2747e-02,  4.0503e-01,  2.0926e-01,
 8.8427e-02,  4.9138e-02, -2.3381e-01,
-5.6521e-02,  7.5013e-02, -1.4783e-01,
-4.7299e-02, -8.1200e-02, -6.5665e-02,
-1.6281e-01, -2.3070e-01,  5.4033e-02,
 1.1527e-01,  3.4730e-01,  1.9293e-02,
-1.8352e-02,  2.0626e-01, -1.1955e-01,
 8.1665e-02,  3.8584e-02,  2.7958e-03,
 6.4294e-02,  1.3912e-01, -5.6370e-02,
-1.7618e-02,  9.0357e-02, -5.5021e-03,
 9.3211e-05,  1.5219e-01,  1.0844e-01,
 7.6218e-02,  1.7016e-01,  9.2438e-02,
 4.3387e-02,  8.0141e-02, -3.2034e-02,
 9.2121e-03, -2.8742e-03, -1.5988e-03,
 9.1980e-03,  1.6983e-02,  3.3154e-03,
-2.5642e-02,  4.1607e-03,  6.9246e-03,
 3.7665e-40, -4.0391e-41, -4.0502e-41,
 2.2436e-40, -1.7190e-40,  1.6583e-40,
 1.4090e-40,  2.2914e-41,  6.7388e-41,
-8.1776e-02,  9.0814e-02,  1.0222e-01,
-3.4949e-02,  1.0266e-01,  3.6826e-02,
-8.3856e-02,  1.1102e-01,  1.1026e-01,
 1.5993e-02, -1.1626e-01, -3.0870e-01,
-3.4119e-03,  1.7638e-01, -1.9092e-01,
-1.2549e-01,  3.2538e-01, -7.9381e-02,
 3.8433e-03, -8.2530e-02,  3.2103e-02,
-1.1637e-02, -1.0371e-01,  2.3851e-02,
 2.5390e-02,  7.7085e-02,  8.9536e-02
);

const float biasL[4] = float[4]
(
 5.3835e-02, -1.6967e-38,  2.2243e-02,  3.2742e-02
);

vec4 hook()
{
    vec4 tl1 = L1_1_texOff(vec2(-1,-1));
    vec4 tc1 = L1_1_texOff(vec2(0,-1));
    vec4 tr1 = L1_1_texOff(vec2(1,-1));
    vec4 ml1 = L1_1_texOff(vec2(-1,0));
    vec4 mc1 = L1_1_texOff(vec2(0,0));
    vec4 mr1 = L1_1_texOff(vec2(1,0));
    vec4 bl1 = L1_1_texOff(vec2(-1,1));
    vec4 bc1 = L1_1_texOff(vec2(0,1));
    vec4 br1 = L1_1_texOff(vec2(1,1));

    vec4 tl2 = L1_2_texOff(vec2(-1,-1));
    vec4 tc2 = L1_2_texOff(vec2(0,-1));
    vec4 tr2 = L1_2_texOff(vec2(1,-1));
    vec4 ml2 = L1_2_texOff(vec2(-1,0));
    vec4 mc2 = L1_2_texOff(vec2(0,0));
    vec4 mr2 = L1_2_texOff(vec2(1,0));
    vec4 bl2 = L1_2_texOff(vec2(-1,1));
    vec4 bc2 = L1_2_texOff(vec2(0,1));
    vec4 br2 = L1_2_texOff(vec2(1,1));

    vec4 c5678 = RELU(vec4(
        tl1.x * kernelsL[0*72+0*9+0] + tc1.x * kernelsL[0*72+0*9+1] + tr1.x * kernelsL[0*72+0*9+2] +
        ml1.x * kernelsL[0*72+0*9+3] + mc1.x * kernelsL[0*72+0*9+4] + mr1.x * kernelsL[0*72+0*9+5] +
        bl1.x * kernelsL[0*72+0*9+6] + bc1.x * kernelsL[0*72+0*9+7] + br1.x * kernelsL[0*72+0*9+8] + 

        tl1.y * kernelsL[0*72+1*9+0] + tc1.y * kernelsL[0*72+1*9+1] + tr1.y * kernelsL[0*72+1*9+2] +
        ml1.y * kernelsL[0*72+1*9+3] + mc1.y * kernelsL[0*72+1*9+4] + mr1.y * kernelsL[0*72+1*9+5] +
        bl1.y * kernelsL[0*72+1*9+6] + bc1.y * kernelsL[0*72+1*9+7] + br1.y * kernelsL[0*72+1*9+8] + 

        tl1.z * kernelsL[0*72+2*9+0] + tc1.z * kernelsL[0*72+2*9+1] + tr1.z * kernelsL[0*72+2*9+2] +
        ml1.z * kernelsL[0*72+2*9+3] + mc1.z * kernelsL[0*72+2*9+4] + mr1.z * kernelsL[0*72+2*9+5] +
        bl1.z * kernelsL[0*72+2*9+6] + bc1.z * kernelsL[0*72+2*9+7] + br1.z * kernelsL[0*72+2*9+8] + 

        tl1.w * kernelsL[0*72+3*9+0] + tc1.w * kernelsL[0*72+3*9+1] + tr1.w * kernelsL[0*72+3*9+2] +
        ml1.w * kernelsL[0*72+3*9+3] + mc1.w * kernelsL[0*72+3*9+4] + mr1.w * kernelsL[0*72+3*9+5] +
        bl1.w * kernelsL[0*72+3*9+6] + bc1.w * kernelsL[0*72+3*9+7] + br1.w * kernelsL[0*72+3*9+8] +

        tl2.x * kernelsL[0*72+4*9+0] + tc2.x * kernelsL[0*72+4*9+1] + tr2.x * kernelsL[0*72+4*9+2] +
        ml2.x * kernelsL[0*72+4*9+3] + mc2.x * kernelsL[0*72+4*9+4] + mr2.x * kernelsL[0*72+4*9+5] +
        bl2.x * kernelsL[0*72+4*9+6] + bc2.x * kernelsL[0*72+4*9+7] + br2.x * kernelsL[0*72+4*9+8] + 

        tl2.y * kernelsL[0*72+5*9+0] + tc2.y * kernelsL[0*72+5*9+1] + tr2.y * kernelsL[0*72+5*9+2] +
        ml2.y * kernelsL[0*72+5*9+3] + mc2.y * kernelsL[0*72+5*9+4] + mr2.y * kernelsL[0*72+5*9+5] +
        bl2.y * kernelsL[0*72+5*9+6] + bc2.y * kernelsL[0*72+5*9+7] + br2.y * kernelsL[0*72+5*9+8] + 

        tl2.z * kernelsL[0*72+6*9+0] + tc2.z * kernelsL[0*72+6*9+1] + tr2.z * kernelsL[0*72+6*9+2] +
        ml2.z * kernelsL[0*72+6*9+3] + mc2.z * kernelsL[0*72+6*9+4] + mr2.z * kernelsL[0*72+6*9+5] +
        bl2.z * kernelsL[0*72+6*9+6] + bc2.z * kernelsL[0*72+6*9+7] + br2.z * kernelsL[0*72+6*9+8] + 

        tl2.w * kernelsL[0*72+7*9+0] + tc2.w * kernelsL[0*72+7*9+1] + tr2.w * kernelsL[0*72+7*9+2] +
        ml2.w * kernelsL[0*72+7*9+3] + mc2.w * kernelsL[0*72+7*9+4] + mr2.w * kernelsL[0*72+7*9+5] +
        bl2.w * kernelsL[0*72+7*9+6] + bc2.w * kernelsL[0*72+7*9+7] + br2.w * kernelsL[0*72+7*9+8] + biasL[0]
        ,
        tl1.x * kernelsL[1*72+0*9+0] + tc1.x * kernelsL[1*72+0*9+1] + tr1.x * kernelsL[1*72+0*9+2] +
        ml1.x * kernelsL[1*72+0*9+3] + mc1.x * kernelsL[1*72+0*9+4] + mr1.x * kernelsL[1*72+0*9+5] +
        bl1.x * kernelsL[1*72+0*9+6] + bc1.x * kernelsL[1*72+0*9+7] + br1.x * kernelsL[1*72+0*9+8] + 

        tl1.y * kernelsL[1*72+1*9+0] + tc1.y * kernelsL[1*72+1*9+1] + tr1.y * kernelsL[1*72+1*9+2] +
        ml1.y * kernelsL[1*72+1*9+3] + mc1.y * kernelsL[1*72+1*9+4] + mr1.y * kernelsL[1*72+1*9+5] +
        bl1.y * kernelsL[1*72+1*9+6] + bc1.y * kernelsL[1*72+1*9+7] + br1.y * kernelsL[1*72+1*9+8] + 

        tl1.z * kernelsL[1*72+2*9+0] + tc1.z * kernelsL[1*72+2*9+1] + tr1.z * kernelsL[1*72+2*9+2] +
        ml1.z * kernelsL[1*72+2*9+3] + mc1.z * kernelsL[1*72+2*9+4] + mr1.z * kernelsL[1*72+2*9+5] +
        bl1.z * kernelsL[1*72+2*9+6] + bc1.z * kernelsL[1*72+2*9+7] + br1.z * kernelsL[1*72+2*9+8] + 

        tl1.w * kernelsL[1*72+3*9+0] + tc1.w * kernelsL[1*72+3*9+1] + tr1.w * kernelsL[1*72+3*9+2] +
        ml1.w * kernelsL[1*72+3*9+3] + mc1.w * kernelsL[1*72+3*9+4] + mr1.w * kernelsL[1*72+3*9+5] +
        bl1.w * kernelsL[1*72+3*9+6] + bc1.w * kernelsL[1*72+3*9+7] + br1.w * kernelsL[1*72+3*9+8] +

        tl2.x * kernelsL[1*72+4*9+0] + tc2.x * kernelsL[1*72+4*9+1] + tr2.x * kernelsL[1*72+4*9+2] +
        ml2.x * kernelsL[1*72+4*9+3] + mc2.x * kernelsL[1*72+4*9+4] + mr2.x * kernelsL[1*72+4*9+5] +
        bl2.x * kernelsL[1*72+4*9+6] + bc2.x * kernelsL[1*72+4*9+7] + br2.x * kernelsL[1*72+4*9+8] + 

        tl2.y * kernelsL[1*72+5*9+0] + tc2.y * kernelsL[1*72+5*9+1] + tr2.y * kernelsL[1*72+5*9+2] +
        ml2.y * kernelsL[1*72+5*9+3] + mc2.y * kernelsL[1*72+5*9+4] + mr2.y * kernelsL[1*72+5*9+5] +
        bl2.y * kernelsL[1*72+5*9+6] + bc2.y * kernelsL[1*72+5*9+7] + br2.y * kernelsL[1*72+5*9+8] + 

        tl2.z * kernelsL[1*72+6*9+0] + tc2.z * kernelsL[1*72+6*9+1] + tr2.z * kernelsL[1*72+6*9+2] +
        ml2.z * kernelsL[1*72+6*9+3] + mc2.z * kernelsL[1*72+6*9+4] + mr2.z * kernelsL[1*72+6*9+5] +
        bl2.z * kernelsL[1*72+6*9+6] + bc2.z * kernelsL[1*72+6*9+7] + br2.z * kernelsL[1*72+6*9+8] + 

        tl2.w * kernelsL[1*72+7*9+0] + tc2.w * kernelsL[1*72+7*9+1] + tr2.w * kernelsL[1*72+7*9+2] +
        ml2.w * kernelsL[1*72+7*9+3] + mc2.w * kernelsL[1*72+7*9+4] + mr2.w * kernelsL[1*72+7*9+5] +
        bl2.w * kernelsL[1*72+7*9+6] + bc2.w * kernelsL[1*72+7*9+7] + br2.w * kernelsL[1*72+7*9+8] + biasL[1]
        ,
        tl1.x * kernelsL[2*72+0*9+0] + tc1.x * kernelsL[2*72+0*9+1] + tr1.x * kernelsL[2*72+0*9+2] +
        ml1.x * kernelsL[2*72+0*9+3] + mc1.x * kernelsL[2*72+0*9+4] + mr1.x * kernelsL[2*72+0*9+5] +
        bl1.x * kernelsL[2*72+0*9+6] + bc1.x * kernelsL[2*72+0*9+7] + br1.x * kernelsL[2*72+0*9+8] + 

        tl1.y * kernelsL[2*72+1*9+0] + tc1.y * kernelsL[2*72+1*9+1] + tr1.y * kernelsL[2*72+1*9+2] +
        ml1.y * kernelsL[2*72+1*9+3] + mc1.y * kernelsL[2*72+1*9+4] + mr1.y * kernelsL[2*72+1*9+5] +
        bl1.y * kernelsL[2*72+1*9+6] + bc1.y * kernelsL[2*72+1*9+7] + br1.y * kernelsL[2*72+1*9+8] + 

        tl1.z * kernelsL[2*72+2*9+0] + tc1.z * kernelsL[2*72+2*9+1] + tr1.z * kernelsL[2*72+2*9+2] +
        ml1.z * kernelsL[2*72+2*9+3] + mc1.z * kernelsL[2*72+2*9+4] + mr1.z * kernelsL[2*72+2*9+5] +
        bl1.z * kernelsL[2*72+2*9+6] + bc1.z * kernelsL[2*72+2*9+7] + br1.z * kernelsL[2*72+2*9+8] + 

        tl1.w * kernelsL[2*72+3*9+0] + tc1.w * kernelsL[2*72+3*9+1] + tr1.w * kernelsL[2*72+3*9+2] +
        ml1.w * kernelsL[2*72+3*9+3] + mc1.w * kernelsL[2*72+3*9+4] + mr1.w * kernelsL[2*72+3*9+5] +
        bl1.w * kernelsL[2*72+3*9+6] + bc1.w * kernelsL[2*72+3*9+7] + br1.w * kernelsL[2*72+3*9+8] +

        tl2.x * kernelsL[2*72+4*9+0] + tc2.x * kernelsL[2*72+4*9+1] + tr2.x * kernelsL[2*72+4*9+2] +
        ml2.x * kernelsL[2*72+4*9+3] + mc2.x * kernelsL[2*72+4*9+4] + mr2.x * kernelsL[2*72+4*9+5] +
        bl2.x * kernelsL[2*72+4*9+6] + bc2.x * kernelsL[2*72+4*9+7] + br2.x * kernelsL[2*72+4*9+8] + 

        tl2.y * kernelsL[2*72+5*9+0] + tc2.y * kernelsL[2*72+5*9+1] + tr2.y * kernelsL[2*72+5*9+2] +
        ml2.y * kernelsL[2*72+5*9+3] + mc2.y * kernelsL[2*72+5*9+4] + mr2.y * kernelsL[2*72+5*9+5] +
        bl2.y * kernelsL[2*72+5*9+6] + bc2.y * kernelsL[2*72+5*9+7] + br2.y * kernelsL[2*72+5*9+8] + 

        tl2.z * kernelsL[2*72+6*9+0] + tc2.z * kernelsL[2*72+6*9+1] + tr2.z * kernelsL[2*72+6*9+2] +
        ml2.z * kernelsL[2*72+6*9+3] + mc2.z * kernelsL[2*72+6*9+4] + mr2.z * kernelsL[2*72+6*9+5] +
        bl2.z * kernelsL[2*72+6*9+6] + bc2.z * kernelsL[2*72+6*9+7] + br2.z * kernelsL[2*72+6*9+8] + 

        tl2.w * kernelsL[2*72+7*9+0] + tc2.w * kernelsL[2*72+7*9+1] + tr2.w * kernelsL[2*72+7*9+2] +
        ml2.w * kernelsL[2*72+7*9+3] + mc2.w * kernelsL[2*72+7*9+4] + mr2.w * kernelsL[2*72+7*9+5] +
        bl2.w * kernelsL[2*72+7*9+6] + bc2.w * kernelsL[2*72+7*9+7] + br2.w * kernelsL[2*72+7*9+8] + biasL[2]
        ,
        tl1.x * kernelsL[3*72+0*9+0] + tc1.x * kernelsL[3*72+0*9+1] + tr1.x * kernelsL[3*72+0*9+2] +
        ml1.x * kernelsL[3*72+0*9+3] + mc1.x * kernelsL[3*72+0*9+4] + mr1.x * kernelsL[3*72+0*9+5] +
        bl1.x * kernelsL[3*72+0*9+6] + bc1.x * kernelsL[3*72+0*9+7] + br1.x * kernelsL[3*72+0*9+8] + 

        tl1.y * kernelsL[3*72+1*9+0] + tc1.y * kernelsL[3*72+1*9+1] + tr1.y * kernelsL[3*72+1*9+2] +
        ml1.y * kernelsL[3*72+1*9+3] + mc1.y * kernelsL[3*72+1*9+4] + mr1.y * kernelsL[3*72+1*9+5] +
        bl1.y * kernelsL[3*72+1*9+6] + bc1.y * kernelsL[3*72+1*9+7] + br1.y * kernelsL[3*72+1*9+8] + 

        tl1.z * kernelsL[3*72+2*9+0] + tc1.z * kernelsL[3*72+2*9+1] + tr1.z * kernelsL[3*72+2*9+2] +
        ml1.z * kernelsL[3*72+2*9+3] + mc1.z * kernelsL[3*72+2*9+4] + mr1.z * kernelsL[3*72+2*9+5] +
        bl1.z * kernelsL[3*72+2*9+6] + bc1.z * kernelsL[3*72+2*9+7] + br1.z * kernelsL[3*72+2*9+8] + 

        tl1.w * kernelsL[3*72+3*9+0] + tc1.w * kernelsL[3*72+3*9+1] + tr1.w * kernelsL[3*72+3*9+2] +
        ml1.w * kernelsL[3*72+3*9+3] + mc1.w * kernelsL[3*72+3*9+4] + mr1.w * kernelsL[3*72+3*9+5] +
        bl1.w * kernelsL[3*72+3*9+6] + bc1.w * kernelsL[3*72+3*9+7] + br1.w * kernelsL[3*72+3*9+8] +

        tl2.x * kernelsL[3*72+4*9+0] + tc2.x * kernelsL[3*72+4*9+1] + tr2.x * kernelsL[3*72+4*9+2] +
        ml2.x * kernelsL[3*72+4*9+3] + mc2.x * kernelsL[3*72+4*9+4] + mr2.x * kernelsL[3*72+4*9+5] +
        bl2.x * kernelsL[3*72+4*9+6] + bc2.x * kernelsL[3*72+4*9+7] + br2.x * kernelsL[3*72+4*9+8] + 

        tl2.y * kernelsL[3*72+5*9+0] + tc2.y * kernelsL[3*72+5*9+1] + tr2.y * kernelsL[3*72+5*9+2] +
        ml2.y * kernelsL[3*72+5*9+3] + mc2.y * kernelsL[3*72+5*9+4] + mr2.y * kernelsL[3*72+5*9+5] +
        bl2.y * kernelsL[3*72+5*9+6] + bc2.y * kernelsL[3*72+5*9+7] + br2.y * kernelsL[3*72+5*9+8] + 

        tl2.z * kernelsL[3*72+6*9+0] + tc2.z * kernelsL[3*72+6*9+1] + tr2.z * kernelsL[3*72+6*9+2] +
        ml2.z * kernelsL[3*72+6*9+3] + mc2.z * kernelsL[3*72+6*9+4] + mr2.z * kernelsL[3*72+6*9+5] +
        bl2.z * kernelsL[3*72+6*9+6] + bc2.z * kernelsL[3*72+6*9+7] + br2.z * kernelsL[3*72+6*9+8] + 

        tl2.w * kernelsL[3*72+7*9+0] + tc2.w * kernelsL[3*72+7*9+1] + tr2.w * kernelsL[3*72+7*9+2] +
        ml2.w * kernelsL[3*72+7*9+3] + mc2.w * kernelsL[3*72+7*9+4] + mr2.w * kernelsL[3*72+7*9+5] +
        bl2.w * kernelsL[3*72+7*9+6] + bc2.w * kernelsL[3*72+7*9+7] + br2.w * kernelsL[3*72+7*9+8] + biasL[3]
    ));


    return c5678;
}

//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L7
//!BIND L2_1
//!BIND L2_2
//!SAVE L1_1
//!COMPONENTS 4

#define RELU(x) max(x, vec4(0.0f))

const float kernelsL[9 * 8 * 4] = float[9 * 8 * 4]
(
-2.8918e-02, -8.3719e-02, -3.3026e-02,
-2.2620e-01,  2.4280e-02, -2.1254e-01,
 2.8231e-02,  3.5323e-02, -2.8425e-02,
 1.6891e-01,  3.8192e-03,  7.2794e-02,
-1.6364e-01, -4.1031e-02, -1.3141e-02,
-3.9478e-02,  1.4910e-01, -7.0978e-02,
-6.3880e-02,  9.8206e-02,  1.3163e-01,
 1.5778e-01,  1.1914e-01,  3.3277e-01,
-3.6808e-01, -5.5627e-01,  1.4401e-01,
-4.0314e-01,  3.6298e-01, -3.8212e-02,
-2.3782e-01,  2.5410e-01, -2.2334e-01,
 7.6542e-02,  9.4998e-02,  3.3399e-02,
-1.8601e-01, -1.8863e-02, -4.1835e-02,
-5.8671e-02, -8.9987e-02, -6.1069e-02,
-7.1062e-02, -9.5987e-02,  1.2318e-02,
 5.4541e-39, -1.8871e-39,  4.5048e-39,
-2.2237e-39, -5.4753e-39,  1.4395e-39,
-3.5753e-39,  6.1466e-40, -2.1567e-39,
 4.5273e-02,  1.1619e-02,  1.1379e-01,
 1.4093e-01,  1.0444e-01,  1.1283e-01,
-3.0230e-02,  3.1937e-01,  5.0541e-02,
 8.2862e-02, -3.1540e-02, -6.4833e-02,
 1.5168e-01,  1.7613e-03,  4.2690e-02,
 1.8820e-01,  4.3783e-02,  6.3473e-02,
 8.0477e-02,  1.0397e-01, -3.6337e-02,
-7.2828e-02,  6.4048e-02,  4.2476e-02,
-1.3974e-04, -2.2468e-01, -4.9189e-02,
-2.7478e-03,  8.7663e-03,  4.3870e-02,
-3.3168e-02,  1.1915e-01, -1.8083e-02,
 4.8155e-02, -4.1742e-02,  1.1251e-01,
-6.1535e-02,  5.1782e-02, -2.3494e-02,
 5.1677e-02,  1.4067e-01, -1.0377e-01,
 3.2951e-03,  1.1942e-02, -1.1775e-01,
-2.2104e-02, -8.1073e-02, -3.7509e-02,
 6.8970e-03,  1.6406e-02,  4.6923e-02,
-8.8448e-03,  2.9130e-02,  3.1024e-02,
 7.6795e-02,  4.6816e-02, -1.3204e-02,
 1.3988e-01,  1.1175e-01,  8.7121e-02,
 1.2097e-01, -3.8463e-02,  6.7387e-02,
 1.4708e-39,  1.7125e-39,  2.7764e-39,
 1.5203e-39,  1.5811e-39,  4.4921e-39,
 1.8828e-39,  1.7593e-39,  2.3774e-39,
 4.3474e-02, -4.7065e-02, -7.1999e-02,
 6.0338e-02,  3.7240e-02,  2.8802e-02,
-4.0701e-02,  1.8627e-02, -1.8181e-02,
 5.5169e-02,  1.1874e-01, -7.0475e-02,
-1.3438e-02,  1.4335e-01,  1.5180e-01,
 5.6331e-02,  7.9719e-02,  6.2691e-03,
-6.6460e-02,  2.7455e-01,  5.5916e-02,
 1.3515e-01, -3.7263e-01,  1.3463e-01,
-4.0820e-05,  3.1896e-01, -8.3871e-02,
-7.6172e-02,  6.1963e-02, -1.3804e-02,
-5.2852e-02,  1.0006e-01, -3.4106e-02,
 6.7218e-02, -3.8616e-03, -7.1788e-02,
 1.6386e-02, -1.8612e-02, -1.7354e-01,
-1.2166e-01,  1.2667e-02, -3.3852e-02,
-3.2897e-02,  1.0343e-01,  2.4924e-01,
-1.3272e-02,  1.5705e-01,  6.7731e-02,
 1.0637e-01,  1.9482e-02, -2.0655e-01,
-5.9087e-03, -7.1073e-02,  1.8723e-02,
-2.6087e-02,  1.5997e-01,  9.6264e-02,
 1.2431e-01,  1.1462e-01, -9.7197e-02,
-6.2347e-02, -4.5239e-02, -2.6443e-02,
 3.7406e-39, -4.6345e-40,  3.7971e-39,
-3.8112e-39, -3.5585e-39,  4.6938e-39,
 6.0588e-39, -4.2403e-39,  1.5311e-39,
 1.6381e-01, -6.8390e-02,  2.6527e-02,
-9.8612e-02,  2.1953e-01, -2.1886e-01,
 7.4841e-02, -1.2118e-01, -8.1700e-02,
 4.4974e-02,  7.7514e-02, -8.4620e-02,
-2.9808e-02,  2.1591e-02, -3.9502e-02,
-5.5797e-02, -6.5105e-02, -5.9860e-02,
-3.7811e-01, -2.3056e-01, -7.4491e-02,
 4.0833e-02, -2.2613e-01, -1.4986e-01,
-1.0974e-01, -6.5161e-01,  1.7546e-01,
 7.7903e-02, -1.5969e-02, -6.3040e-02,
-1.7819e-01, -7.1414e-02,  1.8451e-02,
-1.0618e-01,  3.5614e-03,  3.6719e-02,
 1.5666e-01,  3.9222e-01,  9.1678e-02,
 1.4519e-01,  5.7331e-01, -7.3466e-02,
 1.0271e-01,  1.0803e-01, -1.3150e-01,
 3.7496e-01,  1.5001e-01,  1.4727e-01,
 3.2151e-01,  1.2875e-01, -8.1645e-02,
 2.8629e-01,  1.9329e-01, -8.0009e-02,
-9.9557e-02, -2.6954e-02,  2.6042e-02,
-5.3374e-02,  1.1369e-01,  4.6503e-02,
-3.4068e-02,  9.1849e-03, -9.1420e-02,
 4.6343e-39,  4.8289e-40,  3.1694e-40,
-3.5093e-39, -4.7356e-39,  7.1265e-40,
-4.9626e-39, -2.1280e-39,  1.8542e-39,
-1.3634e-01, -5.4825e-02, -6.6125e-02,
-2.0694e-01,  1.4924e-01,  1.4028e-01,
 3.2735e-02,  7.6360e-02, -9.2541e-02,
-1.2149e-01, -7.9789e-02, -2.9591e-02,
 1.2852e-02,  1.2457e-01,  1.3081e-02,
-3.2966e-03,  1.1089e-01,  8.6461e-02
);

const float biasL[4] = float[4]
(
 1.5629e-02,  2.9703e-02,  2.6412e-02,  1.2301e-02
);

vec4 hook()
{
    vec4 tl1 = L2_1_texOff(vec2(-1,-1));
    vec4 tc1 = L2_1_texOff(vec2(0,-1));
    vec4 tr1 = L2_1_texOff(vec2(1,-1));
    vec4 ml1 = L2_1_texOff(vec2(-1,0));
    vec4 mc1 = L2_1_texOff(vec2(0,0));
    vec4 mr1 = L2_1_texOff(vec2(1,0));
    vec4 bl1 = L2_1_texOff(vec2(-1,1));
    vec4 bc1 = L2_1_texOff(vec2(0,1));
    vec4 br1 = L2_1_texOff(vec2(1,1));

    vec4 tl2 = L2_2_texOff(vec2(-1,-1));
    vec4 tc2 = L2_2_texOff(vec2(0,-1));
    vec4 tr2 = L2_2_texOff(vec2(1,-1));
    vec4 ml2 = L2_2_texOff(vec2(-1,0));
    vec4 mc2 = L2_2_texOff(vec2(0,0));
    vec4 mr2 = L2_2_texOff(vec2(1,0));
    vec4 bl2 = L2_2_texOff(vec2(-1,1));
    vec4 bc2 = L2_2_texOff(vec2(0,1));
    vec4 br2 = L2_2_texOff(vec2(1,1));

    vec4 c1234 = RELU(vec4(
        tl1.x * kernelsL[0*72+0*9+0] + tc1.x * kernelsL[0*72+0*9+1] + tr1.x * kernelsL[0*72+0*9+2] +
        ml1.x * kernelsL[0*72+0*9+3] + mc1.x * kernelsL[0*72+0*9+4] + mr1.x * kernelsL[0*72+0*9+5] +
        bl1.x * kernelsL[0*72+0*9+6] + bc1.x * kernelsL[0*72+0*9+7] + br1.x * kernelsL[0*72+0*9+8] + 

        tl1.y * kernelsL[0*72+1*9+0] + tc1.y * kernelsL[0*72+1*9+1] + tr1.y * kernelsL[0*72+1*9+2] +
        ml1.y * kernelsL[0*72+1*9+3] + mc1.y * kernelsL[0*72+1*9+4] + mr1.y * kernelsL[0*72+1*9+5] +
        bl1.y * kernelsL[0*72+1*9+6] + bc1.y * kernelsL[0*72+1*9+7] + br1.y * kernelsL[0*72+1*9+8] + 

        tl1.z * kernelsL[0*72+2*9+0] + tc1.z * kernelsL[0*72+2*9+1] + tr1.z * kernelsL[0*72+2*9+2] +
        ml1.z * kernelsL[0*72+2*9+3] + mc1.z * kernelsL[0*72+2*9+4] + mr1.z * kernelsL[0*72+2*9+5] +
        bl1.z * kernelsL[0*72+2*9+6] + bc1.z * kernelsL[0*72+2*9+7] + br1.z * kernelsL[0*72+2*9+8] + 

        tl1.w * kernelsL[0*72+3*9+0] + tc1.w * kernelsL[0*72+3*9+1] + tr1.w * kernelsL[0*72+3*9+2] +
        ml1.w * kernelsL[0*72+3*9+3] + mc1.w * kernelsL[0*72+3*9+4] + mr1.w * kernelsL[0*72+3*9+5] +
        bl1.w * kernelsL[0*72+3*9+6] + bc1.w * kernelsL[0*72+3*9+7] + br1.w * kernelsL[0*72+3*9+8] +

        tl2.x * kernelsL[0*72+4*9+0] + tc2.x * kernelsL[0*72+4*9+1] + tr2.x * kernelsL[0*72+4*9+2] +
        ml2.x * kernelsL[0*72+4*9+3] + mc2.x * kernelsL[0*72+4*9+4] + mr2.x * kernelsL[0*72+4*9+5] +
        bl2.x * kernelsL[0*72+4*9+6] + bc2.x * kernelsL[0*72+4*9+7] + br2.x * kernelsL[0*72+4*9+8] + 

        tl2.y * kernelsL[0*72+5*9+0] + tc2.y * kernelsL[0*72+5*9+1] + tr2.y * kernelsL[0*72+5*9+2] +
        ml2.y * kernelsL[0*72+5*9+3] + mc2.y * kernelsL[0*72+5*9+4] + mr2.y * kernelsL[0*72+5*9+5] +
        bl2.y * kernelsL[0*72+5*9+6] + bc2.y * kernelsL[0*72+5*9+7] + br2.y * kernelsL[0*72+5*9+8] + 

        tl2.z * kernelsL[0*72+6*9+0] + tc2.z * kernelsL[0*72+6*9+1] + tr2.z * kernelsL[0*72+6*9+2] +
        ml2.z * kernelsL[0*72+6*9+3] + mc2.z * kernelsL[0*72+6*9+4] + mr2.z * kernelsL[0*72+6*9+5] +
        bl2.z * kernelsL[0*72+6*9+6] + bc2.z * kernelsL[0*72+6*9+7] + br2.z * kernelsL[0*72+6*9+8] + 

        tl2.w * kernelsL[0*72+7*9+0] + tc2.w * kernelsL[0*72+7*9+1] + tr2.w * kernelsL[0*72+7*9+2] +
        ml2.w * kernelsL[0*72+7*9+3] + mc2.w * kernelsL[0*72+7*9+4] + mr2.w * kernelsL[0*72+7*9+5] +
        bl2.w * kernelsL[0*72+7*9+6] + bc2.w * kernelsL[0*72+7*9+7] + br2.w * kernelsL[0*72+7*9+8] + biasL[0]
        ,
        tl1.x * kernelsL[1*72+0*9+0] + tc1.x * kernelsL[1*72+0*9+1] + tr1.x * kernelsL[1*72+0*9+2] +
        ml1.x * kernelsL[1*72+0*9+3] + mc1.x * kernelsL[1*72+0*9+4] + mr1.x * kernelsL[1*72+0*9+5] +
        bl1.x * kernelsL[1*72+0*9+6] + bc1.x * kernelsL[1*72+0*9+7] + br1.x * kernelsL[1*72+0*9+8] + 

        tl1.y * kernelsL[1*72+1*9+0] + tc1.y * kernelsL[1*72+1*9+1] + tr1.y * kernelsL[1*72+1*9+2] +
        ml1.y * kernelsL[1*72+1*9+3] + mc1.y * kernelsL[1*72+1*9+4] + mr1.y * kernelsL[1*72+1*9+5] +
        bl1.y * kernelsL[1*72+1*9+6] + bc1.y * kernelsL[1*72+1*9+7] + br1.y * kernelsL[1*72+1*9+8] + 

        tl1.z * kernelsL[1*72+2*9+0] + tc1.z * kernelsL[1*72+2*9+1] + tr1.z * kernelsL[1*72+2*9+2] +
        ml1.z * kernelsL[1*72+2*9+3] + mc1.z * kernelsL[1*72+2*9+4] + mr1.z * kernelsL[1*72+2*9+5] +
        bl1.z * kernelsL[1*72+2*9+6] + bc1.z * kernelsL[1*72+2*9+7] + br1.z * kernelsL[1*72+2*9+8] + 

        tl1.w * kernelsL[1*72+3*9+0] + tc1.w * kernelsL[1*72+3*9+1] + tr1.w * kernelsL[1*72+3*9+2] +
        ml1.w * kernelsL[1*72+3*9+3] + mc1.w * kernelsL[1*72+3*9+4] + mr1.w * kernelsL[1*72+3*9+5] +
        bl1.w * kernelsL[1*72+3*9+6] + bc1.w * kernelsL[1*72+3*9+7] + br1.w * kernelsL[1*72+3*9+8] +

        tl2.x * kernelsL[1*72+4*9+0] + tc2.x * kernelsL[1*72+4*9+1] + tr2.x * kernelsL[1*72+4*9+2] +
        ml2.x * kernelsL[1*72+4*9+3] + mc2.x * kernelsL[1*72+4*9+4] + mr2.x * kernelsL[1*72+4*9+5] +
        bl2.x * kernelsL[1*72+4*9+6] + bc2.x * kernelsL[1*72+4*9+7] + br2.x * kernelsL[1*72+4*9+8] + 

        tl2.y * kernelsL[1*72+5*9+0] + tc2.y * kernelsL[1*72+5*9+1] + tr2.y * kernelsL[1*72+5*9+2] +
        ml2.y * kernelsL[1*72+5*9+3] + mc2.y * kernelsL[1*72+5*9+4] + mr2.y * kernelsL[1*72+5*9+5] +
        bl2.y * kernelsL[1*72+5*9+6] + bc2.y * kernelsL[1*72+5*9+7] + br2.y * kernelsL[1*72+5*9+8] + 

        tl2.z * kernelsL[1*72+6*9+0] + tc2.z * kernelsL[1*72+6*9+1] + tr2.z * kernelsL[1*72+6*9+2] +
        ml2.z * kernelsL[1*72+6*9+3] + mc2.z * kernelsL[1*72+6*9+4] + mr2.z * kernelsL[1*72+6*9+5] +
        bl2.z * kernelsL[1*72+6*9+6] + bc2.z * kernelsL[1*72+6*9+7] + br2.z * kernelsL[1*72+6*9+8] + 

        tl2.w * kernelsL[1*72+7*9+0] + tc2.w * kernelsL[1*72+7*9+1] + tr2.w * kernelsL[1*72+7*9+2] +
        ml2.w * kernelsL[1*72+7*9+3] + mc2.w * kernelsL[1*72+7*9+4] + mr2.w * kernelsL[1*72+7*9+5] +
        bl2.w * kernelsL[1*72+7*9+6] + bc2.w * kernelsL[1*72+7*9+7] + br2.w * kernelsL[1*72+7*9+8] + biasL[1]
        ,
        tl1.x * kernelsL[2*72+0*9+0] + tc1.x * kernelsL[2*72+0*9+1] + tr1.x * kernelsL[2*72+0*9+2] +
        ml1.x * kernelsL[2*72+0*9+3] + mc1.x * kernelsL[2*72+0*9+4] + mr1.x * kernelsL[2*72+0*9+5] +
        bl1.x * kernelsL[2*72+0*9+6] + bc1.x * kernelsL[2*72+0*9+7] + br1.x * kernelsL[2*72+0*9+8] + 

        tl1.y * kernelsL[2*72+1*9+0] + tc1.y * kernelsL[2*72+1*9+1] + tr1.y * kernelsL[2*72+1*9+2] +
        ml1.y * kernelsL[2*72+1*9+3] + mc1.y * kernelsL[2*72+1*9+4] + mr1.y * kernelsL[2*72+1*9+5] +
        bl1.y * kernelsL[2*72+1*9+6] + bc1.y * kernelsL[2*72+1*9+7] + br1.y * kernelsL[2*72+1*9+8] + 

        tl1.z * kernelsL[2*72+2*9+0] + tc1.z * kernelsL[2*72+2*9+1] + tr1.z * kernelsL[2*72+2*9+2] +
        ml1.z * kernelsL[2*72+2*9+3] + mc1.z * kernelsL[2*72+2*9+4] + mr1.z * kernelsL[2*72+2*9+5] +
        bl1.z * kernelsL[2*72+2*9+6] + bc1.z * kernelsL[2*72+2*9+7] + br1.z * kernelsL[2*72+2*9+8] + 

        tl1.w * kernelsL[2*72+3*9+0] + tc1.w * kernelsL[2*72+3*9+1] + tr1.w * kernelsL[2*72+3*9+2] +
        ml1.w * kernelsL[2*72+3*9+3] + mc1.w * kernelsL[2*72+3*9+4] + mr1.w * kernelsL[2*72+3*9+5] +
        bl1.w * kernelsL[2*72+3*9+6] + bc1.w * kernelsL[2*72+3*9+7] + br1.w * kernelsL[2*72+3*9+8] +

        tl2.x * kernelsL[2*72+4*9+0] + tc2.x * kernelsL[2*72+4*9+1] + tr2.x * kernelsL[2*72+4*9+2] +
        ml2.x * kernelsL[2*72+4*9+3] + mc2.x * kernelsL[2*72+4*9+4] + mr2.x * kernelsL[2*72+4*9+5] +
        bl2.x * kernelsL[2*72+4*9+6] + bc2.x * kernelsL[2*72+4*9+7] + br2.x * kernelsL[2*72+4*9+8] + 

        tl2.y * kernelsL[2*72+5*9+0] + tc2.y * kernelsL[2*72+5*9+1] + tr2.y * kernelsL[2*72+5*9+2] +
        ml2.y * kernelsL[2*72+5*9+3] + mc2.y * kernelsL[2*72+5*9+4] + mr2.y * kernelsL[2*72+5*9+5] +
        bl2.y * kernelsL[2*72+5*9+6] + bc2.y * kernelsL[2*72+5*9+7] + br2.y * kernelsL[2*72+5*9+8] + 

        tl2.z * kernelsL[2*72+6*9+0] + tc2.z * kernelsL[2*72+6*9+1] + tr2.z * kernelsL[2*72+6*9+2] +
        ml2.z * kernelsL[2*72+6*9+3] + mc2.z * kernelsL[2*72+6*9+4] + mr2.z * kernelsL[2*72+6*9+5] +
        bl2.z * kernelsL[2*72+6*9+6] + bc2.z * kernelsL[2*72+6*9+7] + br2.z * kernelsL[2*72+6*9+8] + 

        tl2.w * kernelsL[2*72+7*9+0] + tc2.w * kernelsL[2*72+7*9+1] + tr2.w * kernelsL[2*72+7*9+2] +
        ml2.w * kernelsL[2*72+7*9+3] + mc2.w * kernelsL[2*72+7*9+4] + mr2.w * kernelsL[2*72+7*9+5] +
        bl2.w * kernelsL[2*72+7*9+6] + bc2.w * kernelsL[2*72+7*9+7] + br2.w * kernelsL[2*72+7*9+8] + biasL[2]
        ,
        tl1.x * kernelsL[3*72+0*9+0] + tc1.x * kernelsL[3*72+0*9+1] + tr1.x * kernelsL[3*72+0*9+2] +
        ml1.x * kernelsL[3*72+0*9+3] + mc1.x * kernelsL[3*72+0*9+4] + mr1.x * kernelsL[3*72+0*9+5] +
        bl1.x * kernelsL[3*72+0*9+6] + bc1.x * kernelsL[3*72+0*9+7] + br1.x * kernelsL[3*72+0*9+8] + 

        tl1.y * kernelsL[3*72+1*9+0] + tc1.y * kernelsL[3*72+1*9+1] + tr1.y * kernelsL[3*72+1*9+2] +
        ml1.y * kernelsL[3*72+1*9+3] + mc1.y * kernelsL[3*72+1*9+4] + mr1.y * kernelsL[3*72+1*9+5] +
        bl1.y * kernelsL[3*72+1*9+6] + bc1.y * kernelsL[3*72+1*9+7] + br1.y * kernelsL[3*72+1*9+8] + 

        tl1.z * kernelsL[3*72+2*9+0] + tc1.z * kernelsL[3*72+2*9+1] + tr1.z * kernelsL[3*72+2*9+2] +
        ml1.z * kernelsL[3*72+2*9+3] + mc1.z * kernelsL[3*72+2*9+4] + mr1.z * kernelsL[3*72+2*9+5] +
        bl1.z * kernelsL[3*72+2*9+6] + bc1.z * kernelsL[3*72+2*9+7] + br1.z * kernelsL[3*72+2*9+8] + 

        tl1.w * kernelsL[3*72+3*9+0] + tc1.w * kernelsL[3*72+3*9+1] + tr1.w * kernelsL[3*72+3*9+2] +
        ml1.w * kernelsL[3*72+3*9+3] + mc1.w * kernelsL[3*72+3*9+4] + mr1.w * kernelsL[3*72+3*9+5] +
        bl1.w * kernelsL[3*72+3*9+6] + bc1.w * kernelsL[3*72+3*9+7] + br1.w * kernelsL[3*72+3*9+8] +

        tl2.x * kernelsL[3*72+4*9+0] + tc2.x * kernelsL[3*72+4*9+1] + tr2.x * kernelsL[3*72+4*9+2] +
        ml2.x * kernelsL[3*72+4*9+3] + mc2.x * kernelsL[3*72+4*9+4] + mr2.x * kernelsL[3*72+4*9+5] +
        bl2.x * kernelsL[3*72+4*9+6] + bc2.x * kernelsL[3*72+4*9+7] + br2.x * kernelsL[3*72+4*9+8] + 

        tl2.y * kernelsL[3*72+5*9+0] + tc2.y * kernelsL[3*72+5*9+1] + tr2.y * kernelsL[3*72+5*9+2] +
        ml2.y * kernelsL[3*72+5*9+3] + mc2.y * kernelsL[3*72+5*9+4] + mr2.y * kernelsL[3*72+5*9+5] +
        bl2.y * kernelsL[3*72+5*9+6] + bc2.y * kernelsL[3*72+5*9+7] + br2.y * kernelsL[3*72+5*9+8] + 

        tl2.z * kernelsL[3*72+6*9+0] + tc2.z * kernelsL[3*72+6*9+1] + tr2.z * kernelsL[3*72+6*9+2] +
        ml2.z * kernelsL[3*72+6*9+3] + mc2.z * kernelsL[3*72+6*9+4] + mr2.z * kernelsL[3*72+6*9+5] +
        bl2.z * kernelsL[3*72+6*9+6] + bc2.z * kernelsL[3*72+6*9+7] + br2.z * kernelsL[3*72+6*9+8] + 

        tl2.w * kernelsL[3*72+7*9+0] + tc2.w * kernelsL[3*72+7*9+1] + tr2.w * kernelsL[3*72+7*9+2] +
        ml2.w * kernelsL[3*72+7*9+3] + mc2.w * kernelsL[3*72+7*9+4] + mr2.w * kernelsL[3*72+7*9+5] +
        bl2.w * kernelsL[3*72+7*9+6] + bc2.w * kernelsL[3*72+7*9+7] + br2.w * kernelsL[3*72+7*9+8] + biasL[3]
    ));


    return c1234;
}


//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L7
//!BIND L2_1
//!BIND L2_2
//!SAVE L1_2
//!COMPONENTS 4

#define RELU(x) max(x, vec4(0.0f))

const float kernelsL[9 * 8 * 4] = float[9 * 8 * 4]
(
 1.4352e-01,  5.9238e-02, -2.1140e-02,
 7.3999e-02,  2.0893e-01,  3.5512e-02,
-5.3110e-02,  3.9222e-01,  1.3103e-01,
 1.0168e-01,  1.6685e-02,  5.1616e-02,
 9.8241e-02, -1.6502e-01, -1.2586e-01,
 8.3915e-02,  7.4837e-03,  5.7355e-02,
-3.4982e-02, -1.2773e-01,  6.8213e-02,
-1.4674e-01, -3.6844e-01,  8.1546e-02,
-1.5385e-01, -7.0368e-02,  4.3894e-02,
 7.8201e-02, -1.3952e-01,  1.5154e-01,
 2.3880e-02,  1.4078e-01, -1.2906e-01,
-1.8268e-01, -1.5687e-02, -1.2588e-01,
-9.4643e-03,  1.4718e-02,  7.4932e-02,
 3.0996e-02, -1.2339e-01,  1.7452e-01,
 4.4221e-02, -1.3808e-01, -1.0205e-02,
-8.6959e-40, -3.7907e-39, -1.6020e-41,
 4.3567e-40,  1.4647e-39,  6.5692e-40,
 5.4286e-39,  8.8667e-40, -3.5047e-39,
 2.4116e-02, -9.5358e-02,  1.6468e-01,
 3.1916e-01, -2.3472e-01, -2.1644e-01,
 1.2945e-01, -1.8403e-02, -3.2247e-02,
 1.3666e-02, -3.0548e-02, -4.7635e-02,
-9.2714e-02, -2.1605e-01, -5.9464e-02,
-8.9110e-03, -3.9299e-03, -2.3289e-02,
-1.7855e-01,  9.0661e-03, -1.9142e-02,
-5.6754e-02, -5.4451e-01, -5.7664e-01,
 1.6835e-01,  2.0531e-02,  2.0812e-01,
 5.2794e-02, -9.0414e-02,  3.5560e-02,
 3.7395e-02,  5.9355e-02, -3.6676e-02,
 3.8035e-02,  6.7844e-02,  1.1042e-01,
 5.0372e-02,  6.8188e-02, -8.5353e-02,
 2.2769e-01,  5.9758e-01, -7.4568e-02,
 7.8316e-02,  8.4925e-02, -4.0400e-02,
-7.7984e-02, -2.0739e-01,  1.1736e-01,
 2.4528e-02,  2.1850e-01,  2.5639e-01,
-2.4561e-02,  8.4661e-02, -9.2191e-02,
-2.7006e-02, -7.8921e-02, -2.7124e-02,
-5.9232e-03, -2.7693e-02,  5.9524e-02,
 9.7704e-02,  9.6223e-02,  2.0432e-02,
-2.5588e-39,  5.5478e-39, -5.6209e-39,
-4.7285e-39,  4.5875e-39, -5.7483e-39,
 6.7240e-40, -3.5113e-39, -3.6246e-39,
 1.6870e-03, -2.1707e-01, -3.8895e-02,
-5.8465e-02, -5.9146e-02,  1.1936e-01,
-2.7727e-02, -9.5047e-02, -2.2627e-01,
-9.5155e-02, -7.1422e-02,  9.4611e-03,
 3.7587e-03,  1.6966e-02,  2.8839e-02,
-3.0794e-02,  1.9888e-02, -5.2541e-02,
-1.0708e-02,  3.0171e-02, -3.0473e-01,
-1.0214e-01,  4.2017e-02,  2.5568e-01,
-9.8664e-02, -5.5928e-01, -7.6876e-02,
-8.6821e-03,  4.6484e-02, -3.0836e-01,
-1.0205e-01,  6.8113e-02, -2.8059e-01,
-5.7828e-02,  2.0990e-02, -1.2843e-01,
 7.5680e-02,  1.7504e-02,  1.6278e-01,
 1.4075e-01,  2.4361e-01,  2.2737e-01,
-1.3044e-01,  8.2145e-03,  1.6344e-01,
-2.4780e-03,  1.5108e-01,  1.3313e-02,
-9.5257e-02,  6.1810e-02, -1.9386e-01,
 7.1365e-02,  1.5328e-01,  9.5848e-04,
 1.2278e-01,  7.8318e-02,  3.3400e-02,
 4.8597e-02,  6.0632e-02, -5.7238e-02,
 3.2522e-02,  4.5926e-02, -9.5566e-02,
 1.0844e-39, -3.2490e-39, -2.6904e-39,
-3.0517e-39,  4.7535e-39,  4.3440e-39,
-1.3996e-39,  4.5201e-39, -3.6165e-39,
-5.6164e-02,  1.0353e-01,  6.6228e-02,
 8.2147e-02,  4.7827e-01,  1.2004e-01,
-6.8150e-02,  1.8340e-01,  2.2113e-01,
 1.0580e-05, -2.0949e-01, -1.0358e-01,
 1.6206e-01,  1.2538e-01, -1.3104e-01,
 1.3700e-01,  2.9282e-02, -8.7020e-02,
 4.5467e-39,  5.9787e-39,  2.6105e-39,
-1.2670e-39,  2.9513e-39, -1.0811e-39,
-3.9129e-39, -1.8499e-39,  2.9297e-39,
 5.7414e-39,  5.5907e-39,  5.5702e-39,
 5.9004e-39,  5.7585e-39,  6.3188e-39,
 5.7395e-39,  5.6146e-39,  5.6451e-39,
-7.3964e-39, -6.3330e-39, -5.5236e-39,
-7.5172e-39, -5.8828e-39, -3.7555e-39,
-6.9528e-39, -7.7656e-39, -5.5115e-39,
-7.9031e-39, -7.8200e-39, -7.7914e-39,
-7.4570e-39, -7.6413e-39, -7.9054e-39,
-7.3437e-39, -6.7956e-39, -7.0789e-39,
-3.6774e-40,  1.3572e-40,  3.0250e-40,
-4.1792e-40, -4.6240e-40,  2.2528e-40,
-5.2143e-40, -5.6847e-40, -4.2768e-40,
-4.0128e-39,  1.3485e-39,  1.3436e-39,
 1.5337e-39, -3.9186e-39,  1.2120e-39,
 1.2992e-39,  1.5671e-39,  1.5659e-39,
-4.6533e-39, -4.7029e-39, -6.0334e-39,
-5.1157e-39, -5.3257e-39, -5.8595e-39,
-4.3046e-39, -4.4391e-39, -5.0039e-39,
-1.0025e-39, -1.0145e-39, -8.6762e-40,
-1.0282e-39, -1.0939e-39, -9.4134e-40,
-1.1868e-39, -1.2133e-39, -5.4261e-40
);

const float biasL[4] = float[4]
(
 1.8654e-01, -7.2260e-03,  2.4613e-02, -3.1853e-38
);

vec4 hook()
{
    vec4 tl1 = L2_1_texOff(vec2(-1,-1));
    vec4 tc1 = L2_1_texOff(vec2(0,-1));
    vec4 tr1 = L2_1_texOff(vec2(1,-1));
    vec4 ml1 = L2_1_texOff(vec2(-1,0));
    vec4 mc1 = L2_1_texOff(vec2(0,0));
    vec4 mr1 = L2_1_texOff(vec2(1,0));
    vec4 bl1 = L2_1_texOff(vec2(-1,1));
    vec4 bc1 = L2_1_texOff(vec2(0,1));
    vec4 br1 = L2_1_texOff(vec2(1,1));

    vec4 tl2 = L2_2_texOff(vec2(-1,-1));
    vec4 tc2 = L2_2_texOff(vec2(0,-1));
    vec4 tr2 = L2_2_texOff(vec2(1,-1));
    vec4 ml2 = L2_2_texOff(vec2(-1,0));
    vec4 mc2 = L2_2_texOff(vec2(0,0));
    vec4 mr2 = L2_2_texOff(vec2(1,0));
    vec4 bl2 = L2_2_texOff(vec2(-1,1));
    vec4 bc2 = L2_2_texOff(vec2(0,1));
    vec4 br2 = L2_2_texOff(vec2(1,1));

    vec4 c5678 = RELU(vec4(
        tl1.x * kernelsL[0*72+0*9+0] + tc1.x * kernelsL[0*72+0*9+1] + tr1.x * kernelsL[0*72+0*9+2] +
        ml1.x * kernelsL[0*72+0*9+3] + mc1.x * kernelsL[0*72+0*9+4] + mr1.x * kernelsL[0*72+0*9+5] +
        bl1.x * kernelsL[0*72+0*9+6] + bc1.x * kernelsL[0*72+0*9+7] + br1.x * kernelsL[0*72+0*9+8] + 

        tl1.y * kernelsL[0*72+1*9+0] + tc1.y * kernelsL[0*72+1*9+1] + tr1.y * kernelsL[0*72+1*9+2] +
        ml1.y * kernelsL[0*72+1*9+3] + mc1.y * kernelsL[0*72+1*9+4] + mr1.y * kernelsL[0*72+1*9+5] +
        bl1.y * kernelsL[0*72+1*9+6] + bc1.y * kernelsL[0*72+1*9+7] + br1.y * kernelsL[0*72+1*9+8] + 

        tl1.z * kernelsL[0*72+2*9+0] + tc1.z * kernelsL[0*72+2*9+1] + tr1.z * kernelsL[0*72+2*9+2] +
        ml1.z * kernelsL[0*72+2*9+3] + mc1.z * kernelsL[0*72+2*9+4] + mr1.z * kernelsL[0*72+2*9+5] +
        bl1.z * kernelsL[0*72+2*9+6] + bc1.z * kernelsL[0*72+2*9+7] + br1.z * kernelsL[0*72+2*9+8] + 

        tl1.w * kernelsL[0*72+3*9+0] + tc1.w * kernelsL[0*72+3*9+1] + tr1.w * kernelsL[0*72+3*9+2] +
        ml1.w * kernelsL[0*72+3*9+3] + mc1.w * kernelsL[0*72+3*9+4] + mr1.w * kernelsL[0*72+3*9+5] +
        bl1.w * kernelsL[0*72+3*9+6] + bc1.w * kernelsL[0*72+3*9+7] + br1.w * kernelsL[0*72+3*9+8] +

        tl2.x * kernelsL[0*72+4*9+0] + tc2.x * kernelsL[0*72+4*9+1] + tr2.x * kernelsL[0*72+4*9+2] +
        ml2.x * kernelsL[0*72+4*9+3] + mc2.x * kernelsL[0*72+4*9+4] + mr2.x * kernelsL[0*72+4*9+5] +
        bl2.x * kernelsL[0*72+4*9+6] + bc2.x * kernelsL[0*72+4*9+7] + br2.x * kernelsL[0*72+4*9+8] + 

        tl2.y * kernelsL[0*72+5*9+0] + tc2.y * kernelsL[0*72+5*9+1] + tr2.y * kernelsL[0*72+5*9+2] +
        ml2.y * kernelsL[0*72+5*9+3] + mc2.y * kernelsL[0*72+5*9+4] + mr2.y * kernelsL[0*72+5*9+5] +
        bl2.y * kernelsL[0*72+5*9+6] + bc2.y * kernelsL[0*72+5*9+7] + br2.y * kernelsL[0*72+5*9+8] + 

        tl2.z * kernelsL[0*72+6*9+0] + tc2.z * kernelsL[0*72+6*9+1] + tr2.z * kernelsL[0*72+6*9+2] +
        ml2.z * kernelsL[0*72+6*9+3] + mc2.z * kernelsL[0*72+6*9+4] + mr2.z * kernelsL[0*72+6*9+5] +
        bl2.z * kernelsL[0*72+6*9+6] + bc2.z * kernelsL[0*72+6*9+7] + br2.z * kernelsL[0*72+6*9+8] + 

        tl2.w * kernelsL[0*72+7*9+0] + tc2.w * kernelsL[0*72+7*9+1] + tr2.w * kernelsL[0*72+7*9+2] +
        ml2.w * kernelsL[0*72+7*9+3] + mc2.w * kernelsL[0*72+7*9+4] + mr2.w * kernelsL[0*72+7*9+5] +
        bl2.w * kernelsL[0*72+7*9+6] + bc2.w * kernelsL[0*72+7*9+7] + br2.w * kernelsL[0*72+7*9+8] + biasL[0]
        ,
        tl1.x * kernelsL[1*72+0*9+0] + tc1.x * kernelsL[1*72+0*9+1] + tr1.x * kernelsL[1*72+0*9+2] +
        ml1.x * kernelsL[1*72+0*9+3] + mc1.x * kernelsL[1*72+0*9+4] + mr1.x * kernelsL[1*72+0*9+5] +
        bl1.x * kernelsL[1*72+0*9+6] + bc1.x * kernelsL[1*72+0*9+7] + br1.x * kernelsL[1*72+0*9+8] + 

        tl1.y * kernelsL[1*72+1*9+0] + tc1.y * kernelsL[1*72+1*9+1] + tr1.y * kernelsL[1*72+1*9+2] +
        ml1.y * kernelsL[1*72+1*9+3] + mc1.y * kernelsL[1*72+1*9+4] + mr1.y * kernelsL[1*72+1*9+5] +
        bl1.y * kernelsL[1*72+1*9+6] + bc1.y * kernelsL[1*72+1*9+7] + br1.y * kernelsL[1*72+1*9+8] + 

        tl1.z * kernelsL[1*72+2*9+0] + tc1.z * kernelsL[1*72+2*9+1] + tr1.z * kernelsL[1*72+2*9+2] +
        ml1.z * kernelsL[1*72+2*9+3] + mc1.z * kernelsL[1*72+2*9+4] + mr1.z * kernelsL[1*72+2*9+5] +
        bl1.z * kernelsL[1*72+2*9+6] + bc1.z * kernelsL[1*72+2*9+7] + br1.z * kernelsL[1*72+2*9+8] + 

        tl1.w * kernelsL[1*72+3*9+0] + tc1.w * kernelsL[1*72+3*9+1] + tr1.w * kernelsL[1*72+3*9+2] +
        ml1.w * kernelsL[1*72+3*9+3] + mc1.w * kernelsL[1*72+3*9+4] + mr1.w * kernelsL[1*72+3*9+5] +
        bl1.w * kernelsL[1*72+3*9+6] + bc1.w * kernelsL[1*72+3*9+7] + br1.w * kernelsL[1*72+3*9+8] +

        tl2.x * kernelsL[1*72+4*9+0] + tc2.x * kernelsL[1*72+4*9+1] + tr2.x * kernelsL[1*72+4*9+2] +
        ml2.x * kernelsL[1*72+4*9+3] + mc2.x * kernelsL[1*72+4*9+4] + mr2.x * kernelsL[1*72+4*9+5] +
        bl2.x * kernelsL[1*72+4*9+6] + bc2.x * kernelsL[1*72+4*9+7] + br2.x * kernelsL[1*72+4*9+8] + 

        tl2.y * kernelsL[1*72+5*9+0] + tc2.y * kernelsL[1*72+5*9+1] + tr2.y * kernelsL[1*72+5*9+2] +
        ml2.y * kernelsL[1*72+5*9+3] + mc2.y * kernelsL[1*72+5*9+4] + mr2.y * kernelsL[1*72+5*9+5] +
        bl2.y * kernelsL[1*72+5*9+6] + bc2.y * kernelsL[1*72+5*9+7] + br2.y * kernelsL[1*72+5*9+8] + 

        tl2.z * kernelsL[1*72+6*9+0] + tc2.z * kernelsL[1*72+6*9+1] + tr2.z * kernelsL[1*72+6*9+2] +
        ml2.z * kernelsL[1*72+6*9+3] + mc2.z * kernelsL[1*72+6*9+4] + mr2.z * kernelsL[1*72+6*9+5] +
        bl2.z * kernelsL[1*72+6*9+6] + bc2.z * kernelsL[1*72+6*9+7] + br2.z * kernelsL[1*72+6*9+8] + 

        tl2.w * kernelsL[1*72+7*9+0] + tc2.w * kernelsL[1*72+7*9+1] + tr2.w * kernelsL[1*72+7*9+2] +
        ml2.w * kernelsL[1*72+7*9+3] + mc2.w * kernelsL[1*72+7*9+4] + mr2.w * kernelsL[1*72+7*9+5] +
        bl2.w * kernelsL[1*72+7*9+6] + bc2.w * kernelsL[1*72+7*9+7] + br2.w * kernelsL[1*72+7*9+8] + biasL[1]
        ,
        tl1.x * kernelsL[2*72+0*9+0] + tc1.x * kernelsL[2*72+0*9+1] + tr1.x * kernelsL[2*72+0*9+2] +
        ml1.x * kernelsL[2*72+0*9+3] + mc1.x * kernelsL[2*72+0*9+4] + mr1.x * kernelsL[2*72+0*9+5] +
        bl1.x * kernelsL[2*72+0*9+6] + bc1.x * kernelsL[2*72+0*9+7] + br1.x * kernelsL[2*72+0*9+8] + 

        tl1.y * kernelsL[2*72+1*9+0] + tc1.y * kernelsL[2*72+1*9+1] + tr1.y * kernelsL[2*72+1*9+2] +
        ml1.y * kernelsL[2*72+1*9+3] + mc1.y * kernelsL[2*72+1*9+4] + mr1.y * kernelsL[2*72+1*9+5] +
        bl1.y * kernelsL[2*72+1*9+6] + bc1.y * kernelsL[2*72+1*9+7] + br1.y * kernelsL[2*72+1*9+8] + 

        tl1.z * kernelsL[2*72+2*9+0] + tc1.z * kernelsL[2*72+2*9+1] + tr1.z * kernelsL[2*72+2*9+2] +
        ml1.z * kernelsL[2*72+2*9+3] + mc1.z * kernelsL[2*72+2*9+4] + mr1.z * kernelsL[2*72+2*9+5] +
        bl1.z * kernelsL[2*72+2*9+6] + bc1.z * kernelsL[2*72+2*9+7] + br1.z * kernelsL[2*72+2*9+8] + 

        tl1.w * kernelsL[2*72+3*9+0] + tc1.w * kernelsL[2*72+3*9+1] + tr1.w * kernelsL[2*72+3*9+2] +
        ml1.w * kernelsL[2*72+3*9+3] + mc1.w * kernelsL[2*72+3*9+4] + mr1.w * kernelsL[2*72+3*9+5] +
        bl1.w * kernelsL[2*72+3*9+6] + bc1.w * kernelsL[2*72+3*9+7] + br1.w * kernelsL[2*72+3*9+8] +

        tl2.x * kernelsL[2*72+4*9+0] + tc2.x * kernelsL[2*72+4*9+1] + tr2.x * kernelsL[2*72+4*9+2] +
        ml2.x * kernelsL[2*72+4*9+3] + mc2.x * kernelsL[2*72+4*9+4] + mr2.x * kernelsL[2*72+4*9+5] +
        bl2.x * kernelsL[2*72+4*9+6] + bc2.x * kernelsL[2*72+4*9+7] + br2.x * kernelsL[2*72+4*9+8] + 

        tl2.y * kernelsL[2*72+5*9+0] + tc2.y * kernelsL[2*72+5*9+1] + tr2.y * kernelsL[2*72+5*9+2] +
        ml2.y * kernelsL[2*72+5*9+3] + mc2.y * kernelsL[2*72+5*9+4] + mr2.y * kernelsL[2*72+5*9+5] +
        bl2.y * kernelsL[2*72+5*9+6] + bc2.y * kernelsL[2*72+5*9+7] + br2.y * kernelsL[2*72+5*9+8] + 

        tl2.z * kernelsL[2*72+6*9+0] + tc2.z * kernelsL[2*72+6*9+1] + tr2.z * kernelsL[2*72+6*9+2] +
        ml2.z * kernelsL[2*72+6*9+3] + mc2.z * kernelsL[2*72+6*9+4] + mr2.z * kernelsL[2*72+6*9+5] +
        bl2.z * kernelsL[2*72+6*9+6] + bc2.z * kernelsL[2*72+6*9+7] + br2.z * kernelsL[2*72+6*9+8] + 

        tl2.w * kernelsL[2*72+7*9+0] + tc2.w * kernelsL[2*72+7*9+1] + tr2.w * kernelsL[2*72+7*9+2] +
        ml2.w * kernelsL[2*72+7*9+3] + mc2.w * kernelsL[2*72+7*9+4] + mr2.w * kernelsL[2*72+7*9+5] +
        bl2.w * kernelsL[2*72+7*9+6] + bc2.w * kernelsL[2*72+7*9+7] + br2.w * kernelsL[2*72+7*9+8] + biasL[2]
        ,
        tl1.x * kernelsL[3*72+0*9+0] + tc1.x * kernelsL[3*72+0*9+1] + tr1.x * kernelsL[3*72+0*9+2] +
        ml1.x * kernelsL[3*72+0*9+3] + mc1.x * kernelsL[3*72+0*9+4] + mr1.x * kernelsL[3*72+0*9+5] +
        bl1.x * kernelsL[3*72+0*9+6] + bc1.x * kernelsL[3*72+0*9+7] + br1.x * kernelsL[3*72+0*9+8] + 

        tl1.y * kernelsL[3*72+1*9+0] + tc1.y * kernelsL[3*72+1*9+1] + tr1.y * kernelsL[3*72+1*9+2] +
        ml1.y * kernelsL[3*72+1*9+3] + mc1.y * kernelsL[3*72+1*9+4] + mr1.y * kernelsL[3*72+1*9+5] +
        bl1.y * kernelsL[3*72+1*9+6] + bc1.y * kernelsL[3*72+1*9+7] + br1.y * kernelsL[3*72+1*9+8] + 

        tl1.z * kernelsL[3*72+2*9+0] + tc1.z * kernelsL[3*72+2*9+1] + tr1.z * kernelsL[3*72+2*9+2] +
        ml1.z * kernelsL[3*72+2*9+3] + mc1.z * kernelsL[3*72+2*9+4] + mr1.z * kernelsL[3*72+2*9+5] +
        bl1.z * kernelsL[3*72+2*9+6] + bc1.z * kernelsL[3*72+2*9+7] + br1.z * kernelsL[3*72+2*9+8] + 

        tl1.w * kernelsL[3*72+3*9+0] + tc1.w * kernelsL[3*72+3*9+1] + tr1.w * kernelsL[3*72+3*9+2] +
        ml1.w * kernelsL[3*72+3*9+3] + mc1.w * kernelsL[3*72+3*9+4] + mr1.w * kernelsL[3*72+3*9+5] +
        bl1.w * kernelsL[3*72+3*9+6] + bc1.w * kernelsL[3*72+3*9+7] + br1.w * kernelsL[3*72+3*9+8] +

        tl2.x * kernelsL[3*72+4*9+0] + tc2.x * kernelsL[3*72+4*9+1] + tr2.x * kernelsL[3*72+4*9+2] +
        ml2.x * kernelsL[3*72+4*9+3] + mc2.x * kernelsL[3*72+4*9+4] + mr2.x * kernelsL[3*72+4*9+5] +
        bl2.x * kernelsL[3*72+4*9+6] + bc2.x * kernelsL[3*72+4*9+7] + br2.x * kernelsL[3*72+4*9+8] + 

        tl2.y * kernelsL[3*72+5*9+0] + tc2.y * kernelsL[3*72+5*9+1] + tr2.y * kernelsL[3*72+5*9+2] +
        ml2.y * kernelsL[3*72+5*9+3] + mc2.y * kernelsL[3*72+5*9+4] + mr2.y * kernelsL[3*72+5*9+5] +
        bl2.y * kernelsL[3*72+5*9+6] + bc2.y * kernelsL[3*72+5*9+7] + br2.y * kernelsL[3*72+5*9+8] + 

        tl2.z * kernelsL[3*72+6*9+0] + tc2.z * kernelsL[3*72+6*9+1] + tr2.z * kernelsL[3*72+6*9+2] +
        ml2.z * kernelsL[3*72+6*9+3] + mc2.z * kernelsL[3*72+6*9+4] + mr2.z * kernelsL[3*72+6*9+5] +
        bl2.z * kernelsL[3*72+6*9+6] + bc2.z * kernelsL[3*72+6*9+7] + br2.z * kernelsL[3*72+6*9+8] + 

        tl2.w * kernelsL[3*72+7*9+0] + tc2.w * kernelsL[3*72+7*9+1] + tr2.w * kernelsL[3*72+7*9+2] +
        ml2.w * kernelsL[3*72+7*9+3] + mc2.w * kernelsL[3*72+7*9+4] + mr2.w * kernelsL[3*72+7*9+5] +
        bl2.w * kernelsL[3*72+7*9+6] + bc2.w * kernelsL[3*72+7*9+7] + br2.w * kernelsL[3*72+7*9+8] + biasL[3]
    ));


    return c5678;
}

//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L8
//!BIND L1_1
//!BIND L1_2
//!SAVE L2_1
//!COMPONENTS 4

#define RELU(x) max(x, vec4(0.0f))

const float kernelsL[9 * 8 * 4] = float[9 * 8 * 4]
(
-1.2633e-01,  2.7332e-01, -4.6674e-01,
-9.4537e-03,  9.6797e-02, -6.4975e-01,
 1.8103e-02,  2.7190e-03,  2.3888e-01,
 4.8553e-02, -8.7297e-02,  1.8415e-01,
 3.1194e-02, -7.2899e-02, -8.1835e-02,
 7.1639e-02, -3.1455e-02, -6.2866e-02,
-2.1413e-02,  4.6066e-02,  9.2372e-02,
 1.5761e-01, -1.0352e-01, -3.4808e-01,
 2.3715e-02,  1.6453e-01, -1.3699e-01,
 1.1705e-01, -1.6882e-02,  1.2575e-01,
-2.9834e-02, -1.1558e-01,  4.7318e-01,
 3.5301e-02,  1.1246e-01,  3.5038e-03,
 1.5837e-01, -2.9968e-01,  1.6094e-01,
 4.0562e-02, -1.6329e-01, -3.7023e-02,
-3.9991e-02,  1.7001e-01, -2.7735e-03,
 8.8139e-02, -2.4828e-01,  5.5751e-04,
-1.3871e-01, -2.4839e-01,  1.7996e-03,
-1.1670e-01,  3.3651e-02, -2.9559e-02,
 3.8572e-03,  3.7329e-02,  4.7511e-02,
-7.8848e-02,  1.2844e-01,  9.2677e-02,
-8.5041e-02,  5.7212e-02, -1.0415e-02,
-3.2462e-39,  2.3003e-39,  4.9676e-39,
-3.9261e-39, -6.8290e-40,  5.9119e-39,
-4.1242e-39, -1.1996e-39,  3.8436e-39,
-2.3243e-02, -2.2525e-02,  3.9668e-02,
-1.1210e-01, -2.3892e-01,  1.6431e-01,
-1.3998e-01, -1.5857e-01, -1.5625e-01,
-1.7634e-02, -3.9174e-02, -9.0936e-03,
-3.9428e-03, -1.6411e-02,  2.6484e-03,
 1.1376e-02, -2.9057e-03,  6.3382e-02,
 4.8930e-02,  9.1298e-02,  1.8195e-02,
-6.3365e-02, -1.5407e-01,  8.1543e-02,
 4.9919e-02,  1.6852e-01,  4.4053e-02,
-4.8682e-02, -7.3614e-02, -6.9206e-03,
-4.8193e-02, -2.3704e-01, -8.3394e-03,
 5.6024e-02,  3.7845e-01, -2.4550e-02,
 5.2050e-02,  2.2027e-01, -4.1328e-02,
-6.6327e-02,  1.0450e-01,  1.7058e-02,
-1.2047e-01,  5.2494e-02, -1.8018e-02,
 5.4807e-02,  1.1177e-01,  2.3511e-02,
 6.0413e-03, -3.2457e-02,  7.6611e-02,
-2.1276e-02,  3.0054e-02,  5.0752e-02,
 7.5556e-02,  2.5734e-02, -6.0634e-02,
 1.2201e-01, -4.1533e-01,  2.7634e-02,
 4.5560e-01,  3.2832e-01,  2.6277e-02,
 1.9889e-39,  3.8337e-39,  4.0170e-39,
 1.5149e-39,  3.6456e-39,  4.0474e-39,
 1.1508e-39,  2.7381e-39,  3.8673e-39,
-7.9206e-02, -2.0763e-02, -2.4842e-01,
-6.5777e-02, -1.8446e-01,  2.6178e-01,
-1.7908e-02, -2.3039e-01, -3.5767e-01,
 1.0324e-02,  1.3610e-01,  8.6519e-02,
 1.3499e-01,  3.1933e-02,  9.1822e-03,
-3.6017e-02, -2.2056e-01, -2.3258e-01,
-7.6185e-02, -2.8981e-01, -1.1816e-01,
-9.9048e-02,  5.3879e-02, -1.7351e-01,
-2.1874e-01, -1.2109e-01, -3.1457e-01,
 5.1576e-02, -2.5656e-02,  4.6789e-02,
 7.6286e-02,  6.0126e-01, -2.5925e-01,
-5.3443e-02, -3.3656e-01,  4.7585e-01,
-4.7442e-02, -5.1580e-02, -8.5216e-02,
-1.0600e-01, -1.3859e-01, -3.1484e-01,
 2.1454e-01, -1.1851e-01, -7.6614e-02,
-7.8873e-03, -7.0275e-02, -1.0958e-01,
-8.0654e-02,  1.3946e-01,  2.5292e-01,
 1.3254e-03, -6.7372e-02, -2.6429e-01,
-8.2344e-02,  1.2388e-01,  5.2930e-02,
 8.3665e-02,  3.9729e-01,  4.7687e-02,
-4.4502e-02, -8.3105e-02, -1.6430e-01,
 1.2825e-39,  1.7532e-39,  2.1774e-39,
-2.1331e-39, -2.1826e-39, -1.0009e-39,
 3.7081e-39,  2.0015e-39, -5.8349e-40,
-3.5278e-02,  6.5211e-02, -5.4199e-03,
 8.3961e-02,  3.1410e-02,  4.4510e-02,
-5.4905e-02,  4.0727e-02, -1.5710e-02,
 1.0813e-01,  8.2043e-03,  4.1303e-02,
 1.3405e-01,  1.4150e-01,  7.2155e-02,
 3.3942e-02, -4.7781e-02,  1.6095e-01,
-1.4266e-01, -2.5283e-02,  6.4043e-03,
-1.8699e-02,  1.0895e-01, -2.1497e-02,
 5.5074e-02,  1.7031e-02,  1.0572e-01,
 7.3199e-04,  1.0813e-01, -9.0280e-05,
 1.4808e-01,  2.5436e-01, -1.3749e-01,
 2.2936e-02, -7.9733e-02, -2.2360e-01,
 6.0406e-02, -1.2874e-01, -7.4692e-02,
-1.3216e-01, -9.9889e-03,  2.7608e-03,
-1.1412e-01, -5.1312e-02, -1.7196e-02,
-2.2800e-02, -1.2112e-01, -9.3855e-03,
 3.6905e-02,  1.0049e-01,  9.0602e-03,
-7.3200e-02,  1.0628e-01, -4.8218e-02,
-4.6525e-02,  6.0314e-02, -3.6467e-03,
-8.0943e-02,  2.5461e-01,  1.5461e-01,
-5.7708e-02, -5.7823e-02,  5.4042e-02,
 3.8847e-39,  3.5806e-39,  4.1610e-39,
 3.9082e-39,  4.1898e-39,  4.1926e-39,
 4.1200e-39,  4.3759e-39,  4.3977e-39
);

const float biasL[4] = float[4]
(
-0.0030, -0.0123,  0.0348,  0.0277
);

vec4 hook()
{
    vec4 tl1 = L1_1_texOff(vec2(-1,-1));
    vec4 tc1 = L1_1_texOff(vec2(0,-1));
    vec4 tr1 = L1_1_texOff(vec2(1,-1));
    vec4 ml1 = L1_1_texOff(vec2(-1,0));
    vec4 mc1 = L1_1_texOff(vec2(0,0));
    vec4 mr1 = L1_1_texOff(vec2(1,0));
    vec4 bl1 = L1_1_texOff(vec2(-1,1));
    vec4 bc1 = L1_1_texOff(vec2(0,1));
    vec4 br1 = L1_1_texOff(vec2(1,1));

    vec4 tl2 = L1_2_texOff(vec2(-1,-1));
    vec4 tc2 = L1_2_texOff(vec2(0,-1));
    vec4 tr2 = L1_2_texOff(vec2(1,-1));
    vec4 ml2 = L1_2_texOff(vec2(-1,0));
    vec4 mc2 = L1_2_texOff(vec2(0,0));
    vec4 mr2 = L1_2_texOff(vec2(1,0));
    vec4 bl2 = L1_2_texOff(vec2(-1,1));
    vec4 bc2 = L1_2_texOff(vec2(0,1));
    vec4 br2 = L1_2_texOff(vec2(1,1));

    vec4 c1234 = RELU(vec4(
        tl1.x * kernelsL[0*72+0*9+0] + tc1.x * kernelsL[0*72+0*9+1] + tr1.x * kernelsL[0*72+0*9+2] +
        ml1.x * kernelsL[0*72+0*9+3] + mc1.x * kernelsL[0*72+0*9+4] + mr1.x * kernelsL[0*72+0*9+5] +
        bl1.x * kernelsL[0*72+0*9+6] + bc1.x * kernelsL[0*72+0*9+7] + br1.x * kernelsL[0*72+0*9+8] + 

        tl1.y * kernelsL[0*72+1*9+0] + tc1.y * kernelsL[0*72+1*9+1] + tr1.y * kernelsL[0*72+1*9+2] +
        ml1.y * kernelsL[0*72+1*9+3] + mc1.y * kernelsL[0*72+1*9+4] + mr1.y * kernelsL[0*72+1*9+5] +
        bl1.y * kernelsL[0*72+1*9+6] + bc1.y * kernelsL[0*72+1*9+7] + br1.y * kernelsL[0*72+1*9+8] + 

        tl1.z * kernelsL[0*72+2*9+0] + tc1.z * kernelsL[0*72+2*9+1] + tr1.z * kernelsL[0*72+2*9+2] +
        ml1.z * kernelsL[0*72+2*9+3] + mc1.z * kernelsL[0*72+2*9+4] + mr1.z * kernelsL[0*72+2*9+5] +
        bl1.z * kernelsL[0*72+2*9+6] + bc1.z * kernelsL[0*72+2*9+7] + br1.z * kernelsL[0*72+2*9+8] + 

        tl1.w * kernelsL[0*72+3*9+0] + tc1.w * kernelsL[0*72+3*9+1] + tr1.w * kernelsL[0*72+3*9+2] +
        ml1.w * kernelsL[0*72+3*9+3] + mc1.w * kernelsL[0*72+3*9+4] + mr1.w * kernelsL[0*72+3*9+5] +
        bl1.w * kernelsL[0*72+3*9+6] + bc1.w * kernelsL[0*72+3*9+7] + br1.w * kernelsL[0*72+3*9+8] +

        tl2.x * kernelsL[0*72+4*9+0] + tc2.x * kernelsL[0*72+4*9+1] + tr2.x * kernelsL[0*72+4*9+2] +
        ml2.x * kernelsL[0*72+4*9+3] + mc2.x * kernelsL[0*72+4*9+4] + mr2.x * kernelsL[0*72+4*9+5] +
        bl2.x * kernelsL[0*72+4*9+6] + bc2.x * kernelsL[0*72+4*9+7] + br2.x * kernelsL[0*72+4*9+8] + 

        tl2.y * kernelsL[0*72+5*9+0] + tc2.y * kernelsL[0*72+5*9+1] + tr2.y * kernelsL[0*72+5*9+2] +
        ml2.y * kernelsL[0*72+5*9+3] + mc2.y * kernelsL[0*72+5*9+4] + mr2.y * kernelsL[0*72+5*9+5] +
        bl2.y * kernelsL[0*72+5*9+6] + bc2.y * kernelsL[0*72+5*9+7] + br2.y * kernelsL[0*72+5*9+8] + 

        tl2.z * kernelsL[0*72+6*9+0] + tc2.z * kernelsL[0*72+6*9+1] + tr2.z * kernelsL[0*72+6*9+2] +
        ml2.z * kernelsL[0*72+6*9+3] + mc2.z * kernelsL[0*72+6*9+4] + mr2.z * kernelsL[0*72+6*9+5] +
        bl2.z * kernelsL[0*72+6*9+6] + bc2.z * kernelsL[0*72+6*9+7] + br2.z * kernelsL[0*72+6*9+8] + 

        tl2.w * kernelsL[0*72+7*9+0] + tc2.w * kernelsL[0*72+7*9+1] + tr2.w * kernelsL[0*72+7*9+2] +
        ml2.w * kernelsL[0*72+7*9+3] + mc2.w * kernelsL[0*72+7*9+4] + mr2.w * kernelsL[0*72+7*9+5] +
        bl2.w * kernelsL[0*72+7*9+6] + bc2.w * kernelsL[0*72+7*9+7] + br2.w * kernelsL[0*72+7*9+8] + biasL[0]
        ,
        tl1.x * kernelsL[1*72+0*9+0] + tc1.x * kernelsL[1*72+0*9+1] + tr1.x * kernelsL[1*72+0*9+2] +
        ml1.x * kernelsL[1*72+0*9+3] + mc1.x * kernelsL[1*72+0*9+4] + mr1.x * kernelsL[1*72+0*9+5] +
        bl1.x * kernelsL[1*72+0*9+6] + bc1.x * kernelsL[1*72+0*9+7] + br1.x * kernelsL[1*72+0*9+8] + 

        tl1.y * kernelsL[1*72+1*9+0] + tc1.y * kernelsL[1*72+1*9+1] + tr1.y * kernelsL[1*72+1*9+2] +
        ml1.y * kernelsL[1*72+1*9+3] + mc1.y * kernelsL[1*72+1*9+4] + mr1.y * kernelsL[1*72+1*9+5] +
        bl1.y * kernelsL[1*72+1*9+6] + bc1.y * kernelsL[1*72+1*9+7] + br1.y * kernelsL[1*72+1*9+8] + 

        tl1.z * kernelsL[1*72+2*9+0] + tc1.z * kernelsL[1*72+2*9+1] + tr1.z * kernelsL[1*72+2*9+2] +
        ml1.z * kernelsL[1*72+2*9+3] + mc1.z * kernelsL[1*72+2*9+4] + mr1.z * kernelsL[1*72+2*9+5] +
        bl1.z * kernelsL[1*72+2*9+6] + bc1.z * kernelsL[1*72+2*9+7] + br1.z * kernelsL[1*72+2*9+8] + 

        tl1.w * kernelsL[1*72+3*9+0] + tc1.w * kernelsL[1*72+3*9+1] + tr1.w * kernelsL[1*72+3*9+2] +
        ml1.w * kernelsL[1*72+3*9+3] + mc1.w * kernelsL[1*72+3*9+4] + mr1.w * kernelsL[1*72+3*9+5] +
        bl1.w * kernelsL[1*72+3*9+6] + bc1.w * kernelsL[1*72+3*9+7] + br1.w * kernelsL[1*72+3*9+8] +

        tl2.x * kernelsL[1*72+4*9+0] + tc2.x * kernelsL[1*72+4*9+1] + tr2.x * kernelsL[1*72+4*9+2] +
        ml2.x * kernelsL[1*72+4*9+3] + mc2.x * kernelsL[1*72+4*9+4] + mr2.x * kernelsL[1*72+4*9+5] +
        bl2.x * kernelsL[1*72+4*9+6] + bc2.x * kernelsL[1*72+4*9+7] + br2.x * kernelsL[1*72+4*9+8] + 

        tl2.y * kernelsL[1*72+5*9+0] + tc2.y * kernelsL[1*72+5*9+1] + tr2.y * kernelsL[1*72+5*9+2] +
        ml2.y * kernelsL[1*72+5*9+3] + mc2.y * kernelsL[1*72+5*9+4] + mr2.y * kernelsL[1*72+5*9+5] +
        bl2.y * kernelsL[1*72+5*9+6] + bc2.y * kernelsL[1*72+5*9+7] + br2.y * kernelsL[1*72+5*9+8] + 

        tl2.z * kernelsL[1*72+6*9+0] + tc2.z * kernelsL[1*72+6*9+1] + tr2.z * kernelsL[1*72+6*9+2] +
        ml2.z * kernelsL[1*72+6*9+3] + mc2.z * kernelsL[1*72+6*9+4] + mr2.z * kernelsL[1*72+6*9+5] +
        bl2.z * kernelsL[1*72+6*9+6] + bc2.z * kernelsL[1*72+6*9+7] + br2.z * kernelsL[1*72+6*9+8] + 

        tl2.w * kernelsL[1*72+7*9+0] + tc2.w * kernelsL[1*72+7*9+1] + tr2.w * kernelsL[1*72+7*9+2] +
        ml2.w * kernelsL[1*72+7*9+3] + mc2.w * kernelsL[1*72+7*9+4] + mr2.w * kernelsL[1*72+7*9+5] +
        bl2.w * kernelsL[1*72+7*9+6] + bc2.w * kernelsL[1*72+7*9+7] + br2.w * kernelsL[1*72+7*9+8] + biasL[1]
        ,
        tl1.x * kernelsL[2*72+0*9+0] + tc1.x * kernelsL[2*72+0*9+1] + tr1.x * kernelsL[2*72+0*9+2] +
        ml1.x * kernelsL[2*72+0*9+3] + mc1.x * kernelsL[2*72+0*9+4] + mr1.x * kernelsL[2*72+0*9+5] +
        bl1.x * kernelsL[2*72+0*9+6] + bc1.x * kernelsL[2*72+0*9+7] + br1.x * kernelsL[2*72+0*9+8] + 

        tl1.y * kernelsL[2*72+1*9+0] + tc1.y * kernelsL[2*72+1*9+1] + tr1.y * kernelsL[2*72+1*9+2] +
        ml1.y * kernelsL[2*72+1*9+3] + mc1.y * kernelsL[2*72+1*9+4] + mr1.y * kernelsL[2*72+1*9+5] +
        bl1.y * kernelsL[2*72+1*9+6] + bc1.y * kernelsL[2*72+1*9+7] + br1.y * kernelsL[2*72+1*9+8] + 

        tl1.z * kernelsL[2*72+2*9+0] + tc1.z * kernelsL[2*72+2*9+1] + tr1.z * kernelsL[2*72+2*9+2] +
        ml1.z * kernelsL[2*72+2*9+3] + mc1.z * kernelsL[2*72+2*9+4] + mr1.z * kernelsL[2*72+2*9+5] +
        bl1.z * kernelsL[2*72+2*9+6] + bc1.z * kernelsL[2*72+2*9+7] + br1.z * kernelsL[2*72+2*9+8] + 

        tl1.w * kernelsL[2*72+3*9+0] + tc1.w * kernelsL[2*72+3*9+1] + tr1.w * kernelsL[2*72+3*9+2] +
        ml1.w * kernelsL[2*72+3*9+3] + mc1.w * kernelsL[2*72+3*9+4] + mr1.w * kernelsL[2*72+3*9+5] +
        bl1.w * kernelsL[2*72+3*9+6] + bc1.w * kernelsL[2*72+3*9+7] + br1.w * kernelsL[2*72+3*9+8] +

        tl2.x * kernelsL[2*72+4*9+0] + tc2.x * kernelsL[2*72+4*9+1] + tr2.x * kernelsL[2*72+4*9+2] +
        ml2.x * kernelsL[2*72+4*9+3] + mc2.x * kernelsL[2*72+4*9+4] + mr2.x * kernelsL[2*72+4*9+5] +
        bl2.x * kernelsL[2*72+4*9+6] + bc2.x * kernelsL[2*72+4*9+7] + br2.x * kernelsL[2*72+4*9+8] + 

        tl2.y * kernelsL[2*72+5*9+0] + tc2.y * kernelsL[2*72+5*9+1] + tr2.y * kernelsL[2*72+5*9+2] +
        ml2.y * kernelsL[2*72+5*9+3] + mc2.y * kernelsL[2*72+5*9+4] + mr2.y * kernelsL[2*72+5*9+5] +
        bl2.y * kernelsL[2*72+5*9+6] + bc2.y * kernelsL[2*72+5*9+7] + br2.y * kernelsL[2*72+5*9+8] + 

        tl2.z * kernelsL[2*72+6*9+0] + tc2.z * kernelsL[2*72+6*9+1] + tr2.z * kernelsL[2*72+6*9+2] +
        ml2.z * kernelsL[2*72+6*9+3] + mc2.z * kernelsL[2*72+6*9+4] + mr2.z * kernelsL[2*72+6*9+5] +
        bl2.z * kernelsL[2*72+6*9+6] + bc2.z * kernelsL[2*72+6*9+7] + br2.z * kernelsL[2*72+6*9+8] + 

        tl2.w * kernelsL[2*72+7*9+0] + tc2.w * kernelsL[2*72+7*9+1] + tr2.w * kernelsL[2*72+7*9+2] +
        ml2.w * kernelsL[2*72+7*9+3] + mc2.w * kernelsL[2*72+7*9+4] + mr2.w * kernelsL[2*72+7*9+5] +
        bl2.w * kernelsL[2*72+7*9+6] + bc2.w * kernelsL[2*72+7*9+7] + br2.w * kernelsL[2*72+7*9+8] + biasL[2]
        ,
        tl1.x * kernelsL[3*72+0*9+0] + tc1.x * kernelsL[3*72+0*9+1] + tr1.x * kernelsL[3*72+0*9+2] +
        ml1.x * kernelsL[3*72+0*9+3] + mc1.x * kernelsL[3*72+0*9+4] + mr1.x * kernelsL[3*72+0*9+5] +
        bl1.x * kernelsL[3*72+0*9+6] + bc1.x * kernelsL[3*72+0*9+7] + br1.x * kernelsL[3*72+0*9+8] + 

        tl1.y * kernelsL[3*72+1*9+0] + tc1.y * kernelsL[3*72+1*9+1] + tr1.y * kernelsL[3*72+1*9+2] +
        ml1.y * kernelsL[3*72+1*9+3] + mc1.y * kernelsL[3*72+1*9+4] + mr1.y * kernelsL[3*72+1*9+5] +
        bl1.y * kernelsL[3*72+1*9+6] + bc1.y * kernelsL[3*72+1*9+7] + br1.y * kernelsL[3*72+1*9+8] + 

        tl1.z * kernelsL[3*72+2*9+0] + tc1.z * kernelsL[3*72+2*9+1] + tr1.z * kernelsL[3*72+2*9+2] +
        ml1.z * kernelsL[3*72+2*9+3] + mc1.z * kernelsL[3*72+2*9+4] + mr1.z * kernelsL[3*72+2*9+5] +
        bl1.z * kernelsL[3*72+2*9+6] + bc1.z * kernelsL[3*72+2*9+7] + br1.z * kernelsL[3*72+2*9+8] + 

        tl1.w * kernelsL[3*72+3*9+0] + tc1.w * kernelsL[3*72+3*9+1] + tr1.w * kernelsL[3*72+3*9+2] +
        ml1.w * kernelsL[3*72+3*9+3] + mc1.w * kernelsL[3*72+3*9+4] + mr1.w * kernelsL[3*72+3*9+5] +
        bl1.w * kernelsL[3*72+3*9+6] + bc1.w * kernelsL[3*72+3*9+7] + br1.w * kernelsL[3*72+3*9+8] +

        tl2.x * kernelsL[3*72+4*9+0] + tc2.x * kernelsL[3*72+4*9+1] + tr2.x * kernelsL[3*72+4*9+2] +
        ml2.x * kernelsL[3*72+4*9+3] + mc2.x * kernelsL[3*72+4*9+4] + mr2.x * kernelsL[3*72+4*9+5] +
        bl2.x * kernelsL[3*72+4*9+6] + bc2.x * kernelsL[3*72+4*9+7] + br2.x * kernelsL[3*72+4*9+8] + 

        tl2.y * kernelsL[3*72+5*9+0] + tc2.y * kernelsL[3*72+5*9+1] + tr2.y * kernelsL[3*72+5*9+2] +
        ml2.y * kernelsL[3*72+5*9+3] + mc2.y * kernelsL[3*72+5*9+4] + mr2.y * kernelsL[3*72+5*9+5] +
        bl2.y * kernelsL[3*72+5*9+6] + bc2.y * kernelsL[3*72+5*9+7] + br2.y * kernelsL[3*72+5*9+8] + 

        tl2.z * kernelsL[3*72+6*9+0] + tc2.z * kernelsL[3*72+6*9+1] + tr2.z * kernelsL[3*72+6*9+2] +
        ml2.z * kernelsL[3*72+6*9+3] + mc2.z * kernelsL[3*72+6*9+4] + mr2.z * kernelsL[3*72+6*9+5] +
        bl2.z * kernelsL[3*72+6*9+6] + bc2.z * kernelsL[3*72+6*9+7] + br2.z * kernelsL[3*72+6*9+8] + 

        tl2.w * kernelsL[3*72+7*9+0] + tc2.w * kernelsL[3*72+7*9+1] + tr2.w * kernelsL[3*72+7*9+2] +
        ml2.w * kernelsL[3*72+7*9+3] + mc2.w * kernelsL[3*72+7*9+4] + mr2.w * kernelsL[3*72+7*9+5] +
        bl2.w * kernelsL[3*72+7*9+6] + bc2.w * kernelsL[3*72+7*9+7] + br2.w * kernelsL[3*72+7*9+8] + biasL[3]
    ));


    return c1234;
}


//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L8
//!BIND L1_1
//!BIND L1_2
//!SAVE L2_2
//!COMPONENTS 4

#define RELU(x) max(x, vec4(0.0f))

const float kernelsL[9 * 8 * 4] = float[9 * 8 * 4]
(
-3.3576e-01,  9.5443e-02,  2.7804e-02,
-2.3834e-01, -7.2650e-01, -1.2229e-01,
 1.0380e-01,  1.9520e-01,  3.4571e-02,
-3.7291e-02,  7.6216e-02,  8.6171e-02,
-1.6324e-01, -8.6759e-03,  4.3038e-02,
-3.4364e-02, -7.2777e-03,  3.7451e-02,
 1.8826e-01,  1.6387e-01, -3.4750e-02,
-2.0203e-01,  2.4170e-01,  9.0358e-05,
-1.3049e-01,  9.6855e-02, -1.6737e-03,
-6.3782e-02,  7.1413e-02, -6.5077e-02,
-1.5262e-01,  4.3261e-01, -8.4224e-02,
 6.4632e-02,  1.0553e-01, -1.5274e-01,
 4.4294e-05,  8.6239e-02,  5.7537e-03,
-5.7633e-01, -5.0076e-03, -5.2298e-02,
 1.8556e-01, -1.1332e-02, -2.7010e-02,
 1.6155e-01, -3.0337e-02, -9.6808e-03,
-2.8404e-01, -2.7625e-02,  1.6058e-02,
 5.7937e-02, -6.6464e-02,  1.1096e-02,
 7.8268e-02,  8.6122e-02,  2.9298e-02,
 6.4696e-02,  2.0285e-01,  4.3660e-02,
 1.5339e-01, -3.7650e-02,  7.1438e-03,
-8.9058e-40, -3.6429e-39, -4.7562e-39,
 8.3914e-40, -2.8054e-39, -3.6702e-39,
 4.3666e-39, -1.0602e-39, -3.0369e-39,
 7.2731e-02, -1.0227e-01, -1.9583e-02,
-1.7466e-02, -2.0097e-01,  9.3108e-02,
 6.5196e-02, -1.1880e-01, -3.5152e-03,
-5.6533e-02,  6.2109e-02,  5.2029e-02,
 5.7971e-02,  5.1577e-02,  6.6318e-02,
-2.1669e-03,  7.7274e-02, -4.0609e-02,
 2.8531e-02, -8.3960e-02,  1.3615e-02,
-1.1151e-02, -1.4162e-03,  5.6661e-02,
-8.0954e-02, -1.0600e-01,  4.3276e-02,
 7.6762e-04,  3.1437e-02, -6.1084e-02,
-8.1119e-02,  2.1406e-01,  6.0836e-02,
 4.8105e-02, -1.6263e-01,  9.2555e-03,
 1.1060e-01, -2.1090e-01,  1.6435e-01,
-1.0248e-01, -1.1884e-01, -7.9929e-02,
 5.9980e-02,  1.0271e-01, -1.1891e-02,
-7.5044e-02, -2.3655e-02, -5.2865e-02,
 2.1542e-02,  2.7305e-04,  1.3508e-01,
-1.2317e-02,  9.0742e-02, -3.0079e-03,
-9.9020e-02,  1.5578e-01, -2.1482e-03,
-8.9029e-02,  1.8470e-01,  3.7571e-02,
-2.0394e-01, -1.3735e-01,  2.9648e-02,
-4.3016e-40, -7.3591e-40, -7.3773e-40,
-4.1239e-40, -8.6029e-41, -6.9504e-42,
-7.5082e-40,  1.2975e-40,  2.1462e-40,
-1.8967e-02, -1.4903e-01,  8.1452e-02,
 1.2099e-01, -2.5524e-02,  1.3285e-02,
-1.3780e-01, -5.3359e-02, -3.1310e-02,
-1.8984e-02,  4.1962e-02,  1.0186e-01,
-1.0823e-01,  1.1079e-01,  7.8613e-02,
-1.4521e-01, -7.7509e-02,  1.8768e-02,
 5.0613e-03, -3.0459e-02, -6.3055e-02,
 4.4540e-02,  2.0135e-01,  9.6351e-02,
-1.9495e-02, -1.2314e-01,  1.1720e-02,
 2.1739e-02,  5.2098e-02, -4.0453e-02,
-9.9983e-02,  4.7578e-02, -2.7862e-02,
-8.6565e-02,  1.5241e-01, -4.0462e-02,
 4.0458e-02, -1.2871e-01, -4.3491e-02,
 9.8981e-02, -1.3637e-01,  2.0092e-02,
 1.5626e-01, -8.4550e-04, -2.5701e-02,
 1.8511e-02, -1.0257e-01, -7.3238e-02,
-3.9802e-02, -1.6120e-02, -7.4068e-04,
-1.1377e-02,  9.7975e-03, -9.0342e-02,
-6.7152e-02,  1.0208e-01,  2.5234e-02,
-4.3687e-02,  2.5334e-01,  9.2712e-02,
 3.7702e-01,  4.1450e-02,  1.9934e-02,
-5.4201e-39, -6.7158e-39, -7.5025e-39,
-5.2548e-39, -6.4829e-39, -7.2782e-39,
-4.9999e-39, -5.9599e-39, -6.0469e-39,
 3.5890e-02, -7.3738e-02,  9.8899e-02,
 3.3312e-02,  5.8231e-02, -2.1348e-01,
 8.6289e-02,  5.0837e-02, -6.5613e-02,
 7.0208e-02,  4.1424e-02, -6.0761e-02,
 4.4654e-02, -3.3590e-02, -5.3044e-02,
 1.2319e-01, -4.4666e-02, -8.8193e-02,
-9.0463e-02, -3.0083e-02,  6.8075e-02,
 4.2531e-02,  4.3248e-01,  1.3480e-01,
 9.2389e-02,  1.3683e-01, -2.6092e-01,
 2.8925e-02,  2.3317e-01,  7.8128e-02,
 6.3444e-02,  1.6291e-01, -3.8727e-03,
 6.9107e-02,  6.8477e-03,  3.9528e-01,
 3.8471e-02,  3.0745e-02,  2.8446e-02,
 1.0625e-02, -2.4006e-01, -1.2490e-01,
-1.3002e-01,  2.0025e-01,  4.7618e-02,
-3.9705e-02, -1.2017e-02, -9.8790e-02,
-1.2798e-02, -2.7540e-01, -1.5138e-01,
-1.0290e-01,  5.0112e-02, -1.7391e-01,
-9.7079e-02, -2.2350e-03, -5.9211e-02,
-2.4728e-01,  4.3353e-01, -1.9306e-01,
-1.8039e-01,  1.2689e-01,  5.2103e-02,
-4.5547e-39, -7.8040e-39,  4.1196e-39,
 1.5214e-39,  9.3494e-40, -3.9058e-39,
 7.8718e-39,  7.1728e-39,  5.3609e-39
);

const float biasL[4] = float[4]
(
-0.0152,  0.0005, -0.0124, -0.0209
);

vec4 hook()
{
    vec4 tl1 = L1_1_texOff(vec2(-1,-1));
    vec4 tc1 = L1_1_texOff(vec2(0,-1));
    vec4 tr1 = L1_1_texOff(vec2(1,-1));
    vec4 ml1 = L1_1_texOff(vec2(-1,0));
    vec4 mc1 = L1_1_texOff(vec2(0,0));
    vec4 mr1 = L1_1_texOff(vec2(1,0));
    vec4 bl1 = L1_1_texOff(vec2(-1,1));
    vec4 bc1 = L1_1_texOff(vec2(0,1));
    vec4 br1 = L1_1_texOff(vec2(1,1));

    vec4 tl2 = L1_2_texOff(vec2(-1,-1));
    vec4 tc2 = L1_2_texOff(vec2(0,-1));
    vec4 tr2 = L1_2_texOff(vec2(1,-1));
    vec4 ml2 = L1_2_texOff(vec2(-1,0));
    vec4 mc2 = L1_2_texOff(vec2(0,0));
    vec4 mr2 = L1_2_texOff(vec2(1,0));
    vec4 bl2 = L1_2_texOff(vec2(-1,1));
    vec4 bc2 = L1_2_texOff(vec2(0,1));
    vec4 br2 = L1_2_texOff(vec2(1,1));

    vec4 c5678 = RELU(vec4(
        tl1.x * kernelsL[0*72+0*9+0] + tc1.x * kernelsL[0*72+0*9+1] + tr1.x * kernelsL[0*72+0*9+2] +
        ml1.x * kernelsL[0*72+0*9+3] + mc1.x * kernelsL[0*72+0*9+4] + mr1.x * kernelsL[0*72+0*9+5] +
        bl1.x * kernelsL[0*72+0*9+6] + bc1.x * kernelsL[0*72+0*9+7] + br1.x * kernelsL[0*72+0*9+8] + 

        tl1.y * kernelsL[0*72+1*9+0] + tc1.y * kernelsL[0*72+1*9+1] + tr1.y * kernelsL[0*72+1*9+2] +
        ml1.y * kernelsL[0*72+1*9+3] + mc1.y * kernelsL[0*72+1*9+4] + mr1.y * kernelsL[0*72+1*9+5] +
        bl1.y * kernelsL[0*72+1*9+6] + bc1.y * kernelsL[0*72+1*9+7] + br1.y * kernelsL[0*72+1*9+8] + 

        tl1.z * kernelsL[0*72+2*9+0] + tc1.z * kernelsL[0*72+2*9+1] + tr1.z * kernelsL[0*72+2*9+2] +
        ml1.z * kernelsL[0*72+2*9+3] + mc1.z * kernelsL[0*72+2*9+4] + mr1.z * kernelsL[0*72+2*9+5] +
        bl1.z * kernelsL[0*72+2*9+6] + bc1.z * kernelsL[0*72+2*9+7] + br1.z * kernelsL[0*72+2*9+8] + 

        tl1.w * kernelsL[0*72+3*9+0] + tc1.w * kernelsL[0*72+3*9+1] + tr1.w * kernelsL[0*72+3*9+2] +
        ml1.w * kernelsL[0*72+3*9+3] + mc1.w * kernelsL[0*72+3*9+4] + mr1.w * kernelsL[0*72+3*9+5] +
        bl1.w * kernelsL[0*72+3*9+6] + bc1.w * kernelsL[0*72+3*9+7] + br1.w * kernelsL[0*72+3*9+8] +

        tl2.x * kernelsL[0*72+4*9+0] + tc2.x * kernelsL[0*72+4*9+1] + tr2.x * kernelsL[0*72+4*9+2] +
        ml2.x * kernelsL[0*72+4*9+3] + mc2.x * kernelsL[0*72+4*9+4] + mr2.x * kernelsL[0*72+4*9+5] +
        bl2.x * kernelsL[0*72+4*9+6] + bc2.x * kernelsL[0*72+4*9+7] + br2.x * kernelsL[0*72+4*9+8] + 

        tl2.y * kernelsL[0*72+5*9+0] + tc2.y * kernelsL[0*72+5*9+1] + tr2.y * kernelsL[0*72+5*9+2] +
        ml2.y * kernelsL[0*72+5*9+3] + mc2.y * kernelsL[0*72+5*9+4] + mr2.y * kernelsL[0*72+5*9+5] +
        bl2.y * kernelsL[0*72+5*9+6] + bc2.y * kernelsL[0*72+5*9+7] + br2.y * kernelsL[0*72+5*9+8] + 

        tl2.z * kernelsL[0*72+6*9+0] + tc2.z * kernelsL[0*72+6*9+1] + tr2.z * kernelsL[0*72+6*9+2] +
        ml2.z * kernelsL[0*72+6*9+3] + mc2.z * kernelsL[0*72+6*9+4] + mr2.z * kernelsL[0*72+6*9+5] +
        bl2.z * kernelsL[0*72+6*9+6] + bc2.z * kernelsL[0*72+6*9+7] + br2.z * kernelsL[0*72+6*9+8] + 

        tl2.w * kernelsL[0*72+7*9+0] + tc2.w * kernelsL[0*72+7*9+1] + tr2.w * kernelsL[0*72+7*9+2] +
        ml2.w * kernelsL[0*72+7*9+3] + mc2.w * kernelsL[0*72+7*9+4] + mr2.w * kernelsL[0*72+7*9+5] +
        bl2.w * kernelsL[0*72+7*9+6] + bc2.w * kernelsL[0*72+7*9+7] + br2.w * kernelsL[0*72+7*9+8] + biasL[0]
        ,
        tl1.x * kernelsL[1*72+0*9+0] + tc1.x * kernelsL[1*72+0*9+1] + tr1.x * kernelsL[1*72+0*9+2] +
        ml1.x * kernelsL[1*72+0*9+3] + mc1.x * kernelsL[1*72+0*9+4] + mr1.x * kernelsL[1*72+0*9+5] +
        bl1.x * kernelsL[1*72+0*9+6] + bc1.x * kernelsL[1*72+0*9+7] + br1.x * kernelsL[1*72+0*9+8] + 

        tl1.y * kernelsL[1*72+1*9+0] + tc1.y * kernelsL[1*72+1*9+1] + tr1.y * kernelsL[1*72+1*9+2] +
        ml1.y * kernelsL[1*72+1*9+3] + mc1.y * kernelsL[1*72+1*9+4] + mr1.y * kernelsL[1*72+1*9+5] +
        bl1.y * kernelsL[1*72+1*9+6] + bc1.y * kernelsL[1*72+1*9+7] + br1.y * kernelsL[1*72+1*9+8] + 

        tl1.z * kernelsL[1*72+2*9+0] + tc1.z * kernelsL[1*72+2*9+1] + tr1.z * kernelsL[1*72+2*9+2] +
        ml1.z * kernelsL[1*72+2*9+3] + mc1.z * kernelsL[1*72+2*9+4] + mr1.z * kernelsL[1*72+2*9+5] +
        bl1.z * kernelsL[1*72+2*9+6] + bc1.z * kernelsL[1*72+2*9+7] + br1.z * kernelsL[1*72+2*9+8] + 

        tl1.w * kernelsL[1*72+3*9+0] + tc1.w * kernelsL[1*72+3*9+1] + tr1.w * kernelsL[1*72+3*9+2] +
        ml1.w * kernelsL[1*72+3*9+3] + mc1.w * kernelsL[1*72+3*9+4] + mr1.w * kernelsL[1*72+3*9+5] +
        bl1.w * kernelsL[1*72+3*9+6] + bc1.w * kernelsL[1*72+3*9+7] + br1.w * kernelsL[1*72+3*9+8] +

        tl2.x * kernelsL[1*72+4*9+0] + tc2.x * kernelsL[1*72+4*9+1] + tr2.x * kernelsL[1*72+4*9+2] +
        ml2.x * kernelsL[1*72+4*9+3] + mc2.x * kernelsL[1*72+4*9+4] + mr2.x * kernelsL[1*72+4*9+5] +
        bl2.x * kernelsL[1*72+4*9+6] + bc2.x * kernelsL[1*72+4*9+7] + br2.x * kernelsL[1*72+4*9+8] + 

        tl2.y * kernelsL[1*72+5*9+0] + tc2.y * kernelsL[1*72+5*9+1] + tr2.y * kernelsL[1*72+5*9+2] +
        ml2.y * kernelsL[1*72+5*9+3] + mc2.y * kernelsL[1*72+5*9+4] + mr2.y * kernelsL[1*72+5*9+5] +
        bl2.y * kernelsL[1*72+5*9+6] + bc2.y * kernelsL[1*72+5*9+7] + br2.y * kernelsL[1*72+5*9+8] + 

        tl2.z * kernelsL[1*72+6*9+0] + tc2.z * kernelsL[1*72+6*9+1] + tr2.z * kernelsL[1*72+6*9+2] +
        ml2.z * kernelsL[1*72+6*9+3] + mc2.z * kernelsL[1*72+6*9+4] + mr2.z * kernelsL[1*72+6*9+5] +
        bl2.z * kernelsL[1*72+6*9+6] + bc2.z * kernelsL[1*72+6*9+7] + br2.z * kernelsL[1*72+6*9+8] + 

        tl2.w * kernelsL[1*72+7*9+0] + tc2.w * kernelsL[1*72+7*9+1] + tr2.w * kernelsL[1*72+7*9+2] +
        ml2.w * kernelsL[1*72+7*9+3] + mc2.w * kernelsL[1*72+7*9+4] + mr2.w * kernelsL[1*72+7*9+5] +
        bl2.w * kernelsL[1*72+7*9+6] + bc2.w * kernelsL[1*72+7*9+7] + br2.w * kernelsL[1*72+7*9+8] + biasL[1]
        ,
        tl1.x * kernelsL[2*72+0*9+0] + tc1.x * kernelsL[2*72+0*9+1] + tr1.x * kernelsL[2*72+0*9+2] +
        ml1.x * kernelsL[2*72+0*9+3] + mc1.x * kernelsL[2*72+0*9+4] + mr1.x * kernelsL[2*72+0*9+5] +
        bl1.x * kernelsL[2*72+0*9+6] + bc1.x * kernelsL[2*72+0*9+7] + br1.x * kernelsL[2*72+0*9+8] + 

        tl1.y * kernelsL[2*72+1*9+0] + tc1.y * kernelsL[2*72+1*9+1] + tr1.y * kernelsL[2*72+1*9+2] +
        ml1.y * kernelsL[2*72+1*9+3] + mc1.y * kernelsL[2*72+1*9+4] + mr1.y * kernelsL[2*72+1*9+5] +
        bl1.y * kernelsL[2*72+1*9+6] + bc1.y * kernelsL[2*72+1*9+7] + br1.y * kernelsL[2*72+1*9+8] + 

        tl1.z * kernelsL[2*72+2*9+0] + tc1.z * kernelsL[2*72+2*9+1] + tr1.z * kernelsL[2*72+2*9+2] +
        ml1.z * kernelsL[2*72+2*9+3] + mc1.z * kernelsL[2*72+2*9+4] + mr1.z * kernelsL[2*72+2*9+5] +
        bl1.z * kernelsL[2*72+2*9+6] + bc1.z * kernelsL[2*72+2*9+7] + br1.z * kernelsL[2*72+2*9+8] + 

        tl1.w * kernelsL[2*72+3*9+0] + tc1.w * kernelsL[2*72+3*9+1] + tr1.w * kernelsL[2*72+3*9+2] +
        ml1.w * kernelsL[2*72+3*9+3] + mc1.w * kernelsL[2*72+3*9+4] + mr1.w * kernelsL[2*72+3*9+5] +
        bl1.w * kernelsL[2*72+3*9+6] + bc1.w * kernelsL[2*72+3*9+7] + br1.w * kernelsL[2*72+3*9+8] +

        tl2.x * kernelsL[2*72+4*9+0] + tc2.x * kernelsL[2*72+4*9+1] + tr2.x * kernelsL[2*72+4*9+2] +
        ml2.x * kernelsL[2*72+4*9+3] + mc2.x * kernelsL[2*72+4*9+4] + mr2.x * kernelsL[2*72+4*9+5] +
        bl2.x * kernelsL[2*72+4*9+6] + bc2.x * kernelsL[2*72+4*9+7] + br2.x * kernelsL[2*72+4*9+8] + 

        tl2.y * kernelsL[2*72+5*9+0] + tc2.y * kernelsL[2*72+5*9+1] + tr2.y * kernelsL[2*72+5*9+2] +
        ml2.y * kernelsL[2*72+5*9+3] + mc2.y * kernelsL[2*72+5*9+4] + mr2.y * kernelsL[2*72+5*9+5] +
        bl2.y * kernelsL[2*72+5*9+6] + bc2.y * kernelsL[2*72+5*9+7] + br2.y * kernelsL[2*72+5*9+8] + 

        tl2.z * kernelsL[2*72+6*9+0] + tc2.z * kernelsL[2*72+6*9+1] + tr2.z * kernelsL[2*72+6*9+2] +
        ml2.z * kernelsL[2*72+6*9+3] + mc2.z * kernelsL[2*72+6*9+4] + mr2.z * kernelsL[2*72+6*9+5] +
        bl2.z * kernelsL[2*72+6*9+6] + bc2.z * kernelsL[2*72+6*9+7] + br2.z * kernelsL[2*72+6*9+8] + 

        tl2.w * kernelsL[2*72+7*9+0] + tc2.w * kernelsL[2*72+7*9+1] + tr2.w * kernelsL[2*72+7*9+2] +
        ml2.w * kernelsL[2*72+7*9+3] + mc2.w * kernelsL[2*72+7*9+4] + mr2.w * kernelsL[2*72+7*9+5] +
        bl2.w * kernelsL[2*72+7*9+6] + bc2.w * kernelsL[2*72+7*9+7] + br2.w * kernelsL[2*72+7*9+8] + biasL[2]
        ,
        tl1.x * kernelsL[3*72+0*9+0] + tc1.x * kernelsL[3*72+0*9+1] + tr1.x * kernelsL[3*72+0*9+2] +
        ml1.x * kernelsL[3*72+0*9+3] + mc1.x * kernelsL[3*72+0*9+4] + mr1.x * kernelsL[3*72+0*9+5] +
        bl1.x * kernelsL[3*72+0*9+6] + bc1.x * kernelsL[3*72+0*9+7] + br1.x * kernelsL[3*72+0*9+8] + 

        tl1.y * kernelsL[3*72+1*9+0] + tc1.y * kernelsL[3*72+1*9+1] + tr1.y * kernelsL[3*72+1*9+2] +
        ml1.y * kernelsL[3*72+1*9+3] + mc1.y * kernelsL[3*72+1*9+4] + mr1.y * kernelsL[3*72+1*9+5] +
        bl1.y * kernelsL[3*72+1*9+6] + bc1.y * kernelsL[3*72+1*9+7] + br1.y * kernelsL[3*72+1*9+8] + 

        tl1.z * kernelsL[3*72+2*9+0] + tc1.z * kernelsL[3*72+2*9+1] + tr1.z * kernelsL[3*72+2*9+2] +
        ml1.z * kernelsL[3*72+2*9+3] + mc1.z * kernelsL[3*72+2*9+4] + mr1.z * kernelsL[3*72+2*9+5] +
        bl1.z * kernelsL[3*72+2*9+6] + bc1.z * kernelsL[3*72+2*9+7] + br1.z * kernelsL[3*72+2*9+8] + 

        tl1.w * kernelsL[3*72+3*9+0] + tc1.w * kernelsL[3*72+3*9+1] + tr1.w * kernelsL[3*72+3*9+2] +
        ml1.w * kernelsL[3*72+3*9+3] + mc1.w * kernelsL[3*72+3*9+4] + mr1.w * kernelsL[3*72+3*9+5] +
        bl1.w * kernelsL[3*72+3*9+6] + bc1.w * kernelsL[3*72+3*9+7] + br1.w * kernelsL[3*72+3*9+8] +

        tl2.x * kernelsL[3*72+4*9+0] + tc2.x * kernelsL[3*72+4*9+1] + tr2.x * kernelsL[3*72+4*9+2] +
        ml2.x * kernelsL[3*72+4*9+3] + mc2.x * kernelsL[3*72+4*9+4] + mr2.x * kernelsL[3*72+4*9+5] +
        bl2.x * kernelsL[3*72+4*9+6] + bc2.x * kernelsL[3*72+4*9+7] + br2.x * kernelsL[3*72+4*9+8] + 

        tl2.y * kernelsL[3*72+5*9+0] + tc2.y * kernelsL[3*72+5*9+1] + tr2.y * kernelsL[3*72+5*9+2] +
        ml2.y * kernelsL[3*72+5*9+3] + mc2.y * kernelsL[3*72+5*9+4] + mr2.y * kernelsL[3*72+5*9+5] +
        bl2.y * kernelsL[3*72+5*9+6] + bc2.y * kernelsL[3*72+5*9+7] + br2.y * kernelsL[3*72+5*9+8] + 

        tl2.z * kernelsL[3*72+6*9+0] + tc2.z * kernelsL[3*72+6*9+1] + tr2.z * kernelsL[3*72+6*9+2] +
        ml2.z * kernelsL[3*72+6*9+3] + mc2.z * kernelsL[3*72+6*9+4] + mr2.z * kernelsL[3*72+6*9+5] +
        bl2.z * kernelsL[3*72+6*9+6] + bc2.z * kernelsL[3*72+6*9+7] + br2.z * kernelsL[3*72+6*9+8] + 

        tl2.w * kernelsL[3*72+7*9+0] + tc2.w * kernelsL[3*72+7*9+1] + tr2.w * kernelsL[3*72+7*9+2] +
        ml2.w * kernelsL[3*72+7*9+3] + mc2.w * kernelsL[3*72+7*9+4] + mr2.w * kernelsL[3*72+7*9+5] +
        bl2.w * kernelsL[3*72+7*9+6] + bc2.w * kernelsL[3*72+7*9+7] + br2.w * kernelsL[3*72+7*9+8] + biasL[3]
    ));


    return c5678;
}

//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L9
//!BIND L2_1
//!BIND L2_2
//!SAVE L1_1
//!COMPONENTS 4

#define RELU(x) max(x, vec4(0.0f))

const float kernelsL[9 * 8 * 4] = float[9 * 8 * 4]
(
-9.4505e-02, -7.0477e-02, -1.5792e-04,
-2.3475e-01,  5.8849e-02, -6.8161e-02,
 7.0658e-03, -1.0276e-01,  7.2471e-02,
-7.3820e-03, -3.0740e-02, -1.1131e-01,
 2.8429e-02, -3.5750e-01, -8.4683e-02,
-5.0210e-02, -3.1096e-03, -2.3730e-02,
 4.5756e-02, -3.6724e-01, -7.6317e-02,
 3.8467e-01,  5.5354e-02,  1.6943e-01,
-4.9403e-02,  7.4709e-02, -3.0550e-02,
-7.5324e-03, -1.6910e-01, -1.6103e-01,
 4.6314e-02,  1.2912e-01, -3.0488e-02,
 2.6388e-02,  5.6925e-02,  6.4396e-02,
 3.7748e-03, -2.1310e-02,  1.1410e-01,
-7.0164e-03,  1.8228e-02, -2.5920e-01,
 6.8416e-02,  1.3998e-01,  1.3290e-01,
-3.8861e-02,  8.9898e-02, -3.6631e-03,
 3.5528e-02,  1.1249e-01,  3.7018e-02,
-6.2334e-02, -4.8470e-02, -4.4094e-02,
 3.1574e-02, -1.2162e-01,  1.9669e-01,
-4.6605e-03,  1.1887e-02, -1.1958e-01,
-1.0736e-01,  6.0131e-02, -1.2829e-02,
 2.1305e-01, -8.4750e-02, -2.7028e-02,
-3.0351e-01, -6.4246e-03, -7.9128e-02,
 1.3081e-01,  9.5878e-02,  1.6193e-02,
-5.8335e-02, -5.5968e-02, -2.6284e-03,
-7.2218e-02, -1.1661e-02,  1.9413e-03,
-1.6043e-01,  1.1388e-01, -3.6473e-02,
-2.4077e-02,  1.2210e-01,  1.5531e-02,
 1.5074e-01, -4.5545e-01,  6.1004e-02,
-6.3948e-02,  3.9804e-02, -4.8822e-04,
 1.3135e-01,  9.2392e-02,  8.8914e-02,
 1.2941e-01, -3.6052e-01,  3.9571e-02,
-2.4838e-02,  7.0425e-02, -1.9016e-02,
 2.7629e-02, -7.0648e-02, -2.6838e-02,
-2.1844e-02, -9.6184e-02, -3.3611e-02,
 8.5938e-02,  5.2663e-02,  2.2938e-02,
-6.9909e-03, -3.9627e-03, -6.5162e-02,
-4.9296e-03, -4.0383e-02,  6.7670e-01,
 1.5251e-02,  2.1000e-01, -1.9137e-01,
 2.2825e-02,  1.6640e-02,  3.8147e-02,
 7.1902e-02, -4.9821e-02, -6.5592e-03,
 1.5826e-02,  2.1626e-02,  1.1646e-02,
 1.5180e-02,  1.5664e-01,  9.8696e-03,
-7.2901e-02, -2.1818e-01,  9.2465e-02,
 6.4349e-02,  6.0290e-02, -2.1094e-02,
 2.0633e-02,  4.8808e-02,  1.4080e-02,
 4.8083e-02, -1.5979e-01, -5.3634e-02,
 6.5004e-02,  7.0317e-02,  1.9117e-02,
-4.3048e-02,  5.9627e-02, -1.5068e-02,
 1.8861e-01, -2.6868e-01,  1.2789e-03,
 1.1273e-01, -2.7796e-01,  4.9841e-02,
 4.9008e-03,  1.8241e-02,  4.3449e-02,
 2.1420e-02, -1.0299e-01, -1.6235e-01,
-1.9300e-02, -1.5121e-02,  2.0616e-03,
-2.7591e-01,  3.9622e-02, -5.0492e-02,
 1.1866e-01,  5.5502e-01, -2.3622e-02,
-6.1204e-03, -7.4778e-03,  6.7961e-03,
 2.4215e-02,  2.1643e-03,  1.1442e-01,
 7.5326e-02,  1.4455e-01,  8.0497e-02,
 6.6115e-02,  2.9762e-02,  2.8680e-02,
 3.7784e-03, -2.2769e-02,  2.4529e-02,
-1.1441e-02,  9.8463e-02, -1.2761e-02,
 1.0642e-02,  5.2871e-02,  1.9650e-01,
-2.2225e-02,  3.1504e-02,  8.5645e-03,
 4.9125e-02,  1.4439e-01,  8.4573e-02,
 1.0103e-02,  1.9097e-02,  4.5579e-03,
-2.5773e-02, -4.0984e-02, -1.5402e-01,
 5.3050e-02,  1.5509e-01, -1.9040e-01,
 3.7700e-02,  1.0632e-01, -2.2520e-02,
-5.6582e-02, -4.6040e-02, -5.7562e-03,
-3.4924e-01,  3.2933e-01,  5.5211e-02,
 2.3230e-02,  8.5108e-02,  3.7448e-02,
 1.4266e-02, -7.2016e-02,  4.5252e-03,
-7.0246e-02,  3.9142e-01, -1.9216e-02,
 2.0536e-01, -3.5615e-01,  3.8009e-02,
 1.2252e-02, -5.7966e-02,  9.2672e-02,
 2.4225e-02, -1.0186e-01, -1.4219e-01,
-2.8815e-02,  1.3088e-02, -2.6031e-03,
-6.2341e-02, -1.1216e-01, -7.2122e-02,
 1.1812e-01,  4.3493e-01,  4.3593e-02,
-1.3524e-02,  4.8679e-03, -1.0598e-02,
 3.4904e-02,  5.5813e-02,  4.6811e-02,
 8.0928e-02,  7.6607e-02,  6.3968e-02,
 5.4647e-02,  2.8693e-02,  2.1957e-02,
-8.2725e-03,  5.4668e-02, -3.0533e-02,
-9.3953e-03,  1.5874e-01, -3.6093e-01,
 5.6412e-03,  1.8977e-02,  2.0088e-01,
-1.9414e-02,  1.9088e-02,  1.4504e-02,
 5.8462e-02,  6.2645e-02,  4.9884e-02,
 6.6913e-03,  4.3639e-02,  1.5139e-02,
-2.1897e-02, -1.1436e-01, -5.0838e-02,
 7.1176e-02,  8.4667e-02, -1.4480e-01,
 3.7676e-02,  1.0840e-01, -2.6417e-02,
-4.7584e-02, -4.0524e-02,  6.3032e-03,
-2.4822e-01,  2.4635e-01,  5.5942e-03,
-1.3347e-02,  1.0515e-01,  4.2549e-02
);

const float biasL[4] = float[4]
(
 7.4856e-03, 7.2931e-04, 8.3015e-03, 6.4820e-03
);

vec4 hook()
{
    vec4 tl1 = L2_1_texOff(vec2(-1,-1));
    vec4 tc1 = L2_1_texOff(vec2(0,-1));
    vec4 tr1 = L2_1_texOff(vec2(1,-1));
    vec4 ml1 = L2_1_texOff(vec2(-1,0));
    vec4 mc1 = L2_1_texOff(vec2(0,0));
    vec4 mr1 = L2_1_texOff(vec2(1,0));
    vec4 bl1 = L2_1_texOff(vec2(-1,1));
    vec4 bc1 = L2_1_texOff(vec2(0,1));
    vec4 br1 = L2_1_texOff(vec2(1,1));

    vec4 tl2 = L2_2_texOff(vec2(-1,-1));
    vec4 tc2 = L2_2_texOff(vec2(0,-1));
    vec4 tr2 = L2_2_texOff(vec2(1,-1));
    vec4 ml2 = L2_2_texOff(vec2(-1,0));
    vec4 mc2 = L2_2_texOff(vec2(0,0));
    vec4 mr2 = L2_2_texOff(vec2(1,0));
    vec4 bl2 = L2_2_texOff(vec2(-1,1));
    vec4 bc2 = L2_2_texOff(vec2(0,1));
    vec4 br2 = L2_2_texOff(vec2(1,1));

    vec4 c1234 = RELU(vec4(
        tl1.x * kernelsL[0*72+0*9+0] + tc1.x * kernelsL[0*72+0*9+1] + tr1.x * kernelsL[0*72+0*9+2] +
        ml1.x * kernelsL[0*72+0*9+3] + mc1.x * kernelsL[0*72+0*9+4] + mr1.x * kernelsL[0*72+0*9+5] +
        bl1.x * kernelsL[0*72+0*9+6] + bc1.x * kernelsL[0*72+0*9+7] + br1.x * kernelsL[0*72+0*9+8] + 

        tl1.y * kernelsL[0*72+1*9+0] + tc1.y * kernelsL[0*72+1*9+1] + tr1.y * kernelsL[0*72+1*9+2] +
        ml1.y * kernelsL[0*72+1*9+3] + mc1.y * kernelsL[0*72+1*9+4] + mr1.y * kernelsL[0*72+1*9+5] +
        bl1.y * kernelsL[0*72+1*9+6] + bc1.y * kernelsL[0*72+1*9+7] + br1.y * kernelsL[0*72+1*9+8] + 

        tl1.z * kernelsL[0*72+2*9+0] + tc1.z * kernelsL[0*72+2*9+1] + tr1.z * kernelsL[0*72+2*9+2] +
        ml1.z * kernelsL[0*72+2*9+3] + mc1.z * kernelsL[0*72+2*9+4] + mr1.z * kernelsL[0*72+2*9+5] +
        bl1.z * kernelsL[0*72+2*9+6] + bc1.z * kernelsL[0*72+2*9+7] + br1.z * kernelsL[0*72+2*9+8] + 

        tl1.w * kernelsL[0*72+3*9+0] + tc1.w * kernelsL[0*72+3*9+1] + tr1.w * kernelsL[0*72+3*9+2] +
        ml1.w * kernelsL[0*72+3*9+3] + mc1.w * kernelsL[0*72+3*9+4] + mr1.w * kernelsL[0*72+3*9+5] +
        bl1.w * kernelsL[0*72+3*9+6] + bc1.w * kernelsL[0*72+3*9+7] + br1.w * kernelsL[0*72+3*9+8] +

        tl2.x * kernelsL[0*72+4*9+0] + tc2.x * kernelsL[0*72+4*9+1] + tr2.x * kernelsL[0*72+4*9+2] +
        ml2.x * kernelsL[0*72+4*9+3] + mc2.x * kernelsL[0*72+4*9+4] + mr2.x * kernelsL[0*72+4*9+5] +
        bl2.x * kernelsL[0*72+4*9+6] + bc2.x * kernelsL[0*72+4*9+7] + br2.x * kernelsL[0*72+4*9+8] + 

        tl2.y * kernelsL[0*72+5*9+0] + tc2.y * kernelsL[0*72+5*9+1] + tr2.y * kernelsL[0*72+5*9+2] +
        ml2.y * kernelsL[0*72+5*9+3] + mc2.y * kernelsL[0*72+5*9+4] + mr2.y * kernelsL[0*72+5*9+5] +
        bl2.y * kernelsL[0*72+5*9+6] + bc2.y * kernelsL[0*72+5*9+7] + br2.y * kernelsL[0*72+5*9+8] + 

        tl2.z * kernelsL[0*72+6*9+0] + tc2.z * kernelsL[0*72+6*9+1] + tr2.z * kernelsL[0*72+6*9+2] +
        ml2.z * kernelsL[0*72+6*9+3] + mc2.z * kernelsL[0*72+6*9+4] + mr2.z * kernelsL[0*72+6*9+5] +
        bl2.z * kernelsL[0*72+6*9+6] + bc2.z * kernelsL[0*72+6*9+7] + br2.z * kernelsL[0*72+6*9+8] + 

        tl2.w * kernelsL[0*72+7*9+0] + tc2.w * kernelsL[0*72+7*9+1] + tr2.w * kernelsL[0*72+7*9+2] +
        ml2.w * kernelsL[0*72+7*9+3] + mc2.w * kernelsL[0*72+7*9+4] + mr2.w * kernelsL[0*72+7*9+5] +
        bl2.w * kernelsL[0*72+7*9+6] + bc2.w * kernelsL[0*72+7*9+7] + br2.w * kernelsL[0*72+7*9+8] + biasL[0]
        ,
        tl1.x * kernelsL[1*72+0*9+0] + tc1.x * kernelsL[1*72+0*9+1] + tr1.x * kernelsL[1*72+0*9+2] +
        ml1.x * kernelsL[1*72+0*9+3] + mc1.x * kernelsL[1*72+0*9+4] + mr1.x * kernelsL[1*72+0*9+5] +
        bl1.x * kernelsL[1*72+0*9+6] + bc1.x * kernelsL[1*72+0*9+7] + br1.x * kernelsL[1*72+0*9+8] + 

        tl1.y * kernelsL[1*72+1*9+0] + tc1.y * kernelsL[1*72+1*9+1] + tr1.y * kernelsL[1*72+1*9+2] +
        ml1.y * kernelsL[1*72+1*9+3] + mc1.y * kernelsL[1*72+1*9+4] + mr1.y * kernelsL[1*72+1*9+5] +
        bl1.y * kernelsL[1*72+1*9+6] + bc1.y * kernelsL[1*72+1*9+7] + br1.y * kernelsL[1*72+1*9+8] + 

        tl1.z * kernelsL[1*72+2*9+0] + tc1.z * kernelsL[1*72+2*9+1] + tr1.z * kernelsL[1*72+2*9+2] +
        ml1.z * kernelsL[1*72+2*9+3] + mc1.z * kernelsL[1*72+2*9+4] + mr1.z * kernelsL[1*72+2*9+5] +
        bl1.z * kernelsL[1*72+2*9+6] + bc1.z * kernelsL[1*72+2*9+7] + br1.z * kernelsL[1*72+2*9+8] + 

        tl1.w * kernelsL[1*72+3*9+0] + tc1.w * kernelsL[1*72+3*9+1] + tr1.w * kernelsL[1*72+3*9+2] +
        ml1.w * kernelsL[1*72+3*9+3] + mc1.w * kernelsL[1*72+3*9+4] + mr1.w * kernelsL[1*72+3*9+5] +
        bl1.w * kernelsL[1*72+3*9+6] + bc1.w * kernelsL[1*72+3*9+7] + br1.w * kernelsL[1*72+3*9+8] +

        tl2.x * kernelsL[1*72+4*9+0] + tc2.x * kernelsL[1*72+4*9+1] + tr2.x * kernelsL[1*72+4*9+2] +
        ml2.x * kernelsL[1*72+4*9+3] + mc2.x * kernelsL[1*72+4*9+4] + mr2.x * kernelsL[1*72+4*9+5] +
        bl2.x * kernelsL[1*72+4*9+6] + bc2.x * kernelsL[1*72+4*9+7] + br2.x * kernelsL[1*72+4*9+8] + 

        tl2.y * kernelsL[1*72+5*9+0] + tc2.y * kernelsL[1*72+5*9+1] + tr2.y * kernelsL[1*72+5*9+2] +
        ml2.y * kernelsL[1*72+5*9+3] + mc2.y * kernelsL[1*72+5*9+4] + mr2.y * kernelsL[1*72+5*9+5] +
        bl2.y * kernelsL[1*72+5*9+6] + bc2.y * kernelsL[1*72+5*9+7] + br2.y * kernelsL[1*72+5*9+8] + 

        tl2.z * kernelsL[1*72+6*9+0] + tc2.z * kernelsL[1*72+6*9+1] + tr2.z * kernelsL[1*72+6*9+2] +
        ml2.z * kernelsL[1*72+6*9+3] + mc2.z * kernelsL[1*72+6*9+4] + mr2.z * kernelsL[1*72+6*9+5] +
        bl2.z * kernelsL[1*72+6*9+6] + bc2.z * kernelsL[1*72+6*9+7] + br2.z * kernelsL[1*72+6*9+8] + 

        tl2.w * kernelsL[1*72+7*9+0] + tc2.w * kernelsL[1*72+7*9+1] + tr2.w * kernelsL[1*72+7*9+2] +
        ml2.w * kernelsL[1*72+7*9+3] + mc2.w * kernelsL[1*72+7*9+4] + mr2.w * kernelsL[1*72+7*9+5] +
        bl2.w * kernelsL[1*72+7*9+6] + bc2.w * kernelsL[1*72+7*9+7] + br2.w * kernelsL[1*72+7*9+8] + biasL[1]
        ,
        tl1.x * kernelsL[2*72+0*9+0] + tc1.x * kernelsL[2*72+0*9+1] + tr1.x * kernelsL[2*72+0*9+2] +
        ml1.x * kernelsL[2*72+0*9+3] + mc1.x * kernelsL[2*72+0*9+4] + mr1.x * kernelsL[2*72+0*9+5] +
        bl1.x * kernelsL[2*72+0*9+6] + bc1.x * kernelsL[2*72+0*9+7] + br1.x * kernelsL[2*72+0*9+8] + 

        tl1.y * kernelsL[2*72+1*9+0] + tc1.y * kernelsL[2*72+1*9+1] + tr1.y * kernelsL[2*72+1*9+2] +
        ml1.y * kernelsL[2*72+1*9+3] + mc1.y * kernelsL[2*72+1*9+4] + mr1.y * kernelsL[2*72+1*9+5] +
        bl1.y * kernelsL[2*72+1*9+6] + bc1.y * kernelsL[2*72+1*9+7] + br1.y * kernelsL[2*72+1*9+8] + 

        tl1.z * kernelsL[2*72+2*9+0] + tc1.z * kernelsL[2*72+2*9+1] + tr1.z * kernelsL[2*72+2*9+2] +
        ml1.z * kernelsL[2*72+2*9+3] + mc1.z * kernelsL[2*72+2*9+4] + mr1.z * kernelsL[2*72+2*9+5] +
        bl1.z * kernelsL[2*72+2*9+6] + bc1.z * kernelsL[2*72+2*9+7] + br1.z * kernelsL[2*72+2*9+8] + 

        tl1.w * kernelsL[2*72+3*9+0] + tc1.w * kernelsL[2*72+3*9+1] + tr1.w * kernelsL[2*72+3*9+2] +
        ml1.w * kernelsL[2*72+3*9+3] + mc1.w * kernelsL[2*72+3*9+4] + mr1.w * kernelsL[2*72+3*9+5] +
        bl1.w * kernelsL[2*72+3*9+6] + bc1.w * kernelsL[2*72+3*9+7] + br1.w * kernelsL[2*72+3*9+8] +

        tl2.x * kernelsL[2*72+4*9+0] + tc2.x * kernelsL[2*72+4*9+1] + tr2.x * kernelsL[2*72+4*9+2] +
        ml2.x * kernelsL[2*72+4*9+3] + mc2.x * kernelsL[2*72+4*9+4] + mr2.x * kernelsL[2*72+4*9+5] +
        bl2.x * kernelsL[2*72+4*9+6] + bc2.x * kernelsL[2*72+4*9+7] + br2.x * kernelsL[2*72+4*9+8] + 

        tl2.y * kernelsL[2*72+5*9+0] + tc2.y * kernelsL[2*72+5*9+1] + tr2.y * kernelsL[2*72+5*9+2] +
        ml2.y * kernelsL[2*72+5*9+3] + mc2.y * kernelsL[2*72+5*9+4] + mr2.y * kernelsL[2*72+5*9+5] +
        bl2.y * kernelsL[2*72+5*9+6] + bc2.y * kernelsL[2*72+5*9+7] + br2.y * kernelsL[2*72+5*9+8] + 

        tl2.z * kernelsL[2*72+6*9+0] + tc2.z * kernelsL[2*72+6*9+1] + tr2.z * kernelsL[2*72+6*9+2] +
        ml2.z * kernelsL[2*72+6*9+3] + mc2.z * kernelsL[2*72+6*9+4] + mr2.z * kernelsL[2*72+6*9+5] +
        bl2.z * kernelsL[2*72+6*9+6] + bc2.z * kernelsL[2*72+6*9+7] + br2.z * kernelsL[2*72+6*9+8] + 

        tl2.w * kernelsL[2*72+7*9+0] + tc2.w * kernelsL[2*72+7*9+1] + tr2.w * kernelsL[2*72+7*9+2] +
        ml2.w * kernelsL[2*72+7*9+3] + mc2.w * kernelsL[2*72+7*9+4] + mr2.w * kernelsL[2*72+7*9+5] +
        bl2.w * kernelsL[2*72+7*9+6] + bc2.w * kernelsL[2*72+7*9+7] + br2.w * kernelsL[2*72+7*9+8] + biasL[2]
        ,
        tl1.x * kernelsL[3*72+0*9+0] + tc1.x * kernelsL[3*72+0*9+1] + tr1.x * kernelsL[3*72+0*9+2] +
        ml1.x * kernelsL[3*72+0*9+3] + mc1.x * kernelsL[3*72+0*9+4] + mr1.x * kernelsL[3*72+0*9+5] +
        bl1.x * kernelsL[3*72+0*9+6] + bc1.x * kernelsL[3*72+0*9+7] + br1.x * kernelsL[3*72+0*9+8] + 

        tl1.y * kernelsL[3*72+1*9+0] + tc1.y * kernelsL[3*72+1*9+1] + tr1.y * kernelsL[3*72+1*9+2] +
        ml1.y * kernelsL[3*72+1*9+3] + mc1.y * kernelsL[3*72+1*9+4] + mr1.y * kernelsL[3*72+1*9+5] +
        bl1.y * kernelsL[3*72+1*9+6] + bc1.y * kernelsL[3*72+1*9+7] + br1.y * kernelsL[3*72+1*9+8] + 

        tl1.z * kernelsL[3*72+2*9+0] + tc1.z * kernelsL[3*72+2*9+1] + tr1.z * kernelsL[3*72+2*9+2] +
        ml1.z * kernelsL[3*72+2*9+3] + mc1.z * kernelsL[3*72+2*9+4] + mr1.z * kernelsL[3*72+2*9+5] +
        bl1.z * kernelsL[3*72+2*9+6] + bc1.z * kernelsL[3*72+2*9+7] + br1.z * kernelsL[3*72+2*9+8] + 

        tl1.w * kernelsL[3*72+3*9+0] + tc1.w * kernelsL[3*72+3*9+1] + tr1.w * kernelsL[3*72+3*9+2] +
        ml1.w * kernelsL[3*72+3*9+3] + mc1.w * kernelsL[3*72+3*9+4] + mr1.w * kernelsL[3*72+3*9+5] +
        bl1.w * kernelsL[3*72+3*9+6] + bc1.w * kernelsL[3*72+3*9+7] + br1.w * kernelsL[3*72+3*9+8] +

        tl2.x * kernelsL[3*72+4*9+0] + tc2.x * kernelsL[3*72+4*9+1] + tr2.x * kernelsL[3*72+4*9+2] +
        ml2.x * kernelsL[3*72+4*9+3] + mc2.x * kernelsL[3*72+4*9+4] + mr2.x * kernelsL[3*72+4*9+5] +
        bl2.x * kernelsL[3*72+4*9+6] + bc2.x * kernelsL[3*72+4*9+7] + br2.x * kernelsL[3*72+4*9+8] + 

        tl2.y * kernelsL[3*72+5*9+0] + tc2.y * kernelsL[3*72+5*9+1] + tr2.y * kernelsL[3*72+5*9+2] +
        ml2.y * kernelsL[3*72+5*9+3] + mc2.y * kernelsL[3*72+5*9+4] + mr2.y * kernelsL[3*72+5*9+5] +
        bl2.y * kernelsL[3*72+5*9+6] + bc2.y * kernelsL[3*72+5*9+7] + br2.y * kernelsL[3*72+5*9+8] + 

        tl2.z * kernelsL[3*72+6*9+0] + tc2.z * kernelsL[3*72+6*9+1] + tr2.z * kernelsL[3*72+6*9+2] +
        ml2.z * kernelsL[3*72+6*9+3] + mc2.z * kernelsL[3*72+6*9+4] + mr2.z * kernelsL[3*72+6*9+5] +
        bl2.z * kernelsL[3*72+6*9+6] + bc2.z * kernelsL[3*72+6*9+7] + br2.z * kernelsL[3*72+6*9+8] + 

        tl2.w * kernelsL[3*72+7*9+0] + tc2.w * kernelsL[3*72+7*9+1] + tr2.w * kernelsL[3*72+7*9+2] +
        ml2.w * kernelsL[3*72+7*9+3] + mc2.w * kernelsL[3*72+7*9+4] + mr2.w * kernelsL[3*72+7*9+5] +
        bl2.w * kernelsL[3*72+7*9+6] + bc2.w * kernelsL[3*72+7*9+7] + br2.w * kernelsL[3*72+7*9+8] + biasL[3]
    ));


    return c1234;
}


//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L9
//!BIND L2_1
//!BIND L2_2
//!SAVE L1_2
//!COMPONENTS 4

#define RELU(x) max(x, vec4(0.0f))

const float kernelsL[9 * 8 * 4] = float[9 * 8 * 4]
(
-1.2380e-01,  4.1074e-02,  1.2608e-02,
-1.2042e-01,  2.9516e-01,  2.8380e-03,
 5.1930e-01, -1.6498e-01,  5.7152e-02,
-6.5519e-02,  1.1001e-01,  2.8943e-02,
 1.0854e-01, -6.0107e-02, -1.6730e-01,
-4.4417e-02,  3.4347e-02, -3.3756e-02,
 2.0694e-01,  3.3047e-01, -9.4497e-02,
-2.1977e-01,  4.6614e-02,  1.2201e-01,
-2.9541e-02,  1.8900e-01, -1.8391e-01,
 2.0064e-02, -3.2480e-02, -8.9041e-03,
-5.6385e-02, -6.4531e-02,  1.2879e-02,
-3.2499e-02,  1.0883e-02,  7.3564e-03,
 1.9828e-02, -2.3278e-01, -4.3789e-03,
 9.7669e-02,  1.3008e-01, -1.0405e-01,
 2.2618e-02, -2.5495e-01, -1.0718e-01,
 4.3524e-02, -7.3127e-02,  8.2424e-02,
-5.0193e-02,  4.0634e-03,  4.0696e-02,
 2.7419e-02,  1.8353e-01,  9.2117e-02,
-7.4918e-02,  1.0602e-01, -3.4752e-02,
-1.3331e-01, -2.9583e-02, -5.2197e-03,
-3.7852e-02,  1.5998e-01,  1.5078e-03,
-5.6512e-02,  1.3378e-01,  1.4512e-02,
 4.5255e-02,  2.4702e-01, -2.4848e-02,
-1.7526e-01,  1.5532e-01,  8.6686e-02,
 3.1486e-02, -2.3247e-02,  9.7320e-03,
-5.2106e-01,  4.7937e-02,  4.1614e-02,
 5.5436e-02, -2.0432e-01,  1.2444e-02,
-5.6792e-02, -5.5632e-02,  5.7612e-02,
-6.0248e-04,  4.9770e-02, -6.7956e-02,
 1.3389e-02, -9.4141e-03, -7.3497e-03,
-4.6361e-01,  2.7450e-01, -8.2210e-02,
-2.6737e-01, -6.6114e-02,  6.3568e-02,
 1.6910e-02,  1.4456e-01, -9.0081e-02,
 8.8278e-03,  2.1776e-02,  8.7710e-03,
-2.3378e-02, -4.3907e-02, -3.6751e-02,
-2.4694e-03, -6.0419e-03,  3.0840e-02,
-1.6968e-02, -8.2266e-02, -1.0049e-01,
 3.4429e-02,  1.0960e-01,  3.8355e-01,
-4.0301e-04, -3.1089e-02, -2.1373e-02,
-2.4172e-02,  4.6432e-02,  8.0742e-03,
-2.3134e-02,  1.7789e-02,  2.7136e-02,
 3.0729e-02,  6.9008e-03,  1.2822e-02,
 3.5043e-02, -6.1749e-02, -1.2565e-02,
-1.0354e-02, -2.6515e-03,  4.5632e-03,
-5.9818e-02, -9.7686e-04, -6.6467e-03,
-5.0833e-01,  1.8474e-02,  1.3598e-02,
 3.6287e-01,  1.3698e-01, -1.2806e-02,
-2.8618e-02, -2.9128e-02,  2.9855e-02,
 8.1243e-02,  4.7414e-02, -4.7434e-02,
-3.3738e-02, -3.4926e-01,  1.7786e-02,
 1.0056e-01, -5.7937e-02, -1.8308e-02,
 1.8214e-02, -1.9519e-01,  2.2152e-02,
-7.3543e-02,  2.0786e-01, -5.8196e-02,
 3.9396e-02, -4.5349e-02,  1.5748e-02,
-5.4604e-03,  4.5777e-01,  1.7295e-01,
-2.0570e-01, -3.0970e-01, -1.9075e-01,
 7.6751e-02, -1.3099e-01,  6.1278e-02,
 6.0222e-02,  5.4418e-02,  1.2259e-01,
 3.2160e-02,  8.5146e-03,  3.4578e-02,
-5.4391e-02, -2.5285e-02,  1.0251e-02,
-3.2763e-02,  7.9163e-02, -7.5136e-02,
 1.8545e-02, -2.1972e-02,  1.3887e+00,
-1.2402e-03, -2.5679e-01,  7.2392e-02,
 4.9692e-03,  1.7034e-02,  4.7043e-02,
 1.2093e-02, -3.1230e-02, -8.2613e-03,
-7.8701e-03, -2.3516e-03, -7.2487e-04,
 6.8495e-02, -5.2837e-02, -2.2482e-01,
 1.3259e-02,  4.8009e-01, -4.0940e-02,
-4.1547e-02, -2.8753e-02, -5.2579e-03,
-1.7152e-01, -3.3676e-02,  1.5080e-02,
 8.6014e-02,  7.9239e-02,  4.2196e-02,
-9.2870e-02, -1.5913e-02, -6.5804e-03,
 4.0364e-02,  2.4914e-02, -1.4638e-02,
 8.8705e-03,  2.8037e-01,  3.9890e-02,
 1.1638e-01,  2.9467e-01, -4.3518e-03,
 7.1091e-02, -2.2378e-01,  4.7315e-02,
 3.8006e-02, -2.0246e-01, -3.8679e-02,
-5.8004e-02,  5.8991e-02, -6.2149e-03,
-1.3034e-01,  1.5540e-01, -5.2558e-02,
 8.1594e-02,  3.5570e-01,  2.1220e-02,
 1.4977e-02,  2.4493e-03, -4.0627e-02,
 1.1402e-01,  6.6962e-02,  1.1150e-01,
 1.1824e-01,  1.1492e-01,  1.1219e-01,
 6.6067e-02,  6.9639e-02, -8.1836e-02,
-2.7144e-02,  1.4677e-01, -5.9261e-02,
 4.4573e-03,  2.6235e-01, -7.4379e-01,
-8.3569e-03,  9.4465e-02, -6.5653e-03,
 2.1095e-02, -1.8853e-02,  6.7972e-02,
 1.2957e-01,  3.0122e-02, -1.0061e-02,
-3.4832e-02,  8.5404e-02,  5.7663e-02,
-5.0400e-02, -1.2050e-01, -2.3344e-01,
 1.4977e-01,  7.8806e-02,  6.0771e-03,
 5.6483e-02,  6.3927e-02, -5.8376e-03,
-2.8124e-01,  5.2581e-02, -1.3918e-04,
-1.4341e-01,  3.6558e-01,  4.7332e-02,
-3.9089e-02,  8.4188e-02,  2.7058e-02
);

const float biasL[4] = float[4]
(
 2.4008e-04, 7.0377e-06, 1.7948e-03, 8.9869e-03
);

vec4 hook()
{
    vec4 tl1 = L2_1_texOff(vec2(-1,-1));
    vec4 tc1 = L2_1_texOff(vec2(0,-1));
    vec4 tr1 = L2_1_texOff(vec2(1,-1));
    vec4 ml1 = L2_1_texOff(vec2(-1,0));
    vec4 mc1 = L2_1_texOff(vec2(0,0));
    vec4 mr1 = L2_1_texOff(vec2(1,0));
    vec4 bl1 = L2_1_texOff(vec2(-1,1));
    vec4 bc1 = L2_1_texOff(vec2(0,1));
    vec4 br1 = L2_1_texOff(vec2(1,1));

    vec4 tl2 = L2_2_texOff(vec2(-1,-1));
    vec4 tc2 = L2_2_texOff(vec2(0,-1));
    vec4 tr2 = L2_2_texOff(vec2(1,-1));
    vec4 ml2 = L2_2_texOff(vec2(-1,0));
    vec4 mc2 = L2_2_texOff(vec2(0,0));
    vec4 mr2 = L2_2_texOff(vec2(1,0));
    vec4 bl2 = L2_2_texOff(vec2(-1,1));
    vec4 bc2 = L2_2_texOff(vec2(0,1));
    vec4 br2 = L2_2_texOff(vec2(1,1));

    vec4 c5678 = RELU(vec4(
        tl1.x * kernelsL[0*72+0*9+0] + tc1.x * kernelsL[0*72+0*9+1] + tr1.x * kernelsL[0*72+0*9+2] +
        ml1.x * kernelsL[0*72+0*9+3] + mc1.x * kernelsL[0*72+0*9+4] + mr1.x * kernelsL[0*72+0*9+5] +
        bl1.x * kernelsL[0*72+0*9+6] + bc1.x * kernelsL[0*72+0*9+7] + br1.x * kernelsL[0*72+0*9+8] + 

        tl1.y * kernelsL[0*72+1*9+0] + tc1.y * kernelsL[0*72+1*9+1] + tr1.y * kernelsL[0*72+1*9+2] +
        ml1.y * kernelsL[0*72+1*9+3] + mc1.y * kernelsL[0*72+1*9+4] + mr1.y * kernelsL[0*72+1*9+5] +
        bl1.y * kernelsL[0*72+1*9+6] + bc1.y * kernelsL[0*72+1*9+7] + br1.y * kernelsL[0*72+1*9+8] + 

        tl1.z * kernelsL[0*72+2*9+0] + tc1.z * kernelsL[0*72+2*9+1] + tr1.z * kernelsL[0*72+2*9+2] +
        ml1.z * kernelsL[0*72+2*9+3] + mc1.z * kernelsL[0*72+2*9+4] + mr1.z * kernelsL[0*72+2*9+5] +
        bl1.z * kernelsL[0*72+2*9+6] + bc1.z * kernelsL[0*72+2*9+7] + br1.z * kernelsL[0*72+2*9+8] + 

        tl1.w * kernelsL[0*72+3*9+0] + tc1.w * kernelsL[0*72+3*9+1] + tr1.w * kernelsL[0*72+3*9+2] +
        ml1.w * kernelsL[0*72+3*9+3] + mc1.w * kernelsL[0*72+3*9+4] + mr1.w * kernelsL[0*72+3*9+5] +
        bl1.w * kernelsL[0*72+3*9+6] + bc1.w * kernelsL[0*72+3*9+7] + br1.w * kernelsL[0*72+3*9+8] +

        tl2.x * kernelsL[0*72+4*9+0] + tc2.x * kernelsL[0*72+4*9+1] + tr2.x * kernelsL[0*72+4*9+2] +
        ml2.x * kernelsL[0*72+4*9+3] + mc2.x * kernelsL[0*72+4*9+4] + mr2.x * kernelsL[0*72+4*9+5] +
        bl2.x * kernelsL[0*72+4*9+6] + bc2.x * kernelsL[0*72+4*9+7] + br2.x * kernelsL[0*72+4*9+8] + 

        tl2.y * kernelsL[0*72+5*9+0] + tc2.y * kernelsL[0*72+5*9+1] + tr2.y * kernelsL[0*72+5*9+2] +
        ml2.y * kernelsL[0*72+5*9+3] + mc2.y * kernelsL[0*72+5*9+4] + mr2.y * kernelsL[0*72+5*9+5] +
        bl2.y * kernelsL[0*72+5*9+6] + bc2.y * kernelsL[0*72+5*9+7] + br2.y * kernelsL[0*72+5*9+8] + 

        tl2.z * kernelsL[0*72+6*9+0] + tc2.z * kernelsL[0*72+6*9+1] + tr2.z * kernelsL[0*72+6*9+2] +
        ml2.z * kernelsL[0*72+6*9+3] + mc2.z * kernelsL[0*72+6*9+4] + mr2.z * kernelsL[0*72+6*9+5] +
        bl2.z * kernelsL[0*72+6*9+6] + bc2.z * kernelsL[0*72+6*9+7] + br2.z * kernelsL[0*72+6*9+8] + 

        tl2.w * kernelsL[0*72+7*9+0] + tc2.w * kernelsL[0*72+7*9+1] + tr2.w * kernelsL[0*72+7*9+2] +
        ml2.w * kernelsL[0*72+7*9+3] + mc2.w * kernelsL[0*72+7*9+4] + mr2.w * kernelsL[0*72+7*9+5] +
        bl2.w * kernelsL[0*72+7*9+6] + bc2.w * kernelsL[0*72+7*9+7] + br2.w * kernelsL[0*72+7*9+8] + biasL[0]
        ,
        tl1.x * kernelsL[1*72+0*9+0] + tc1.x * kernelsL[1*72+0*9+1] + tr1.x * kernelsL[1*72+0*9+2] +
        ml1.x * kernelsL[1*72+0*9+3] + mc1.x * kernelsL[1*72+0*9+4] + mr1.x * kernelsL[1*72+0*9+5] +
        bl1.x * kernelsL[1*72+0*9+6] + bc1.x * kernelsL[1*72+0*9+7] + br1.x * kernelsL[1*72+0*9+8] + 

        tl1.y * kernelsL[1*72+1*9+0] + tc1.y * kernelsL[1*72+1*9+1] + tr1.y * kernelsL[1*72+1*9+2] +
        ml1.y * kernelsL[1*72+1*9+3] + mc1.y * kernelsL[1*72+1*9+4] + mr1.y * kernelsL[1*72+1*9+5] +
        bl1.y * kernelsL[1*72+1*9+6] + bc1.y * kernelsL[1*72+1*9+7] + br1.y * kernelsL[1*72+1*9+8] + 

        tl1.z * kernelsL[1*72+2*9+0] + tc1.z * kernelsL[1*72+2*9+1] + tr1.z * kernelsL[1*72+2*9+2] +
        ml1.z * kernelsL[1*72+2*9+3] + mc1.z * kernelsL[1*72+2*9+4] + mr1.z * kernelsL[1*72+2*9+5] +
        bl1.z * kernelsL[1*72+2*9+6] + bc1.z * kernelsL[1*72+2*9+7] + br1.z * kernelsL[1*72+2*9+8] + 

        tl1.w * kernelsL[1*72+3*9+0] + tc1.w * kernelsL[1*72+3*9+1] + tr1.w * kernelsL[1*72+3*9+2] +
        ml1.w * kernelsL[1*72+3*9+3] + mc1.w * kernelsL[1*72+3*9+4] + mr1.w * kernelsL[1*72+3*9+5] +
        bl1.w * kernelsL[1*72+3*9+6] + bc1.w * kernelsL[1*72+3*9+7] + br1.w * kernelsL[1*72+3*9+8] +

        tl2.x * kernelsL[1*72+4*9+0] + tc2.x * kernelsL[1*72+4*9+1] + tr2.x * kernelsL[1*72+4*9+2] +
        ml2.x * kernelsL[1*72+4*9+3] + mc2.x * kernelsL[1*72+4*9+4] + mr2.x * kernelsL[1*72+4*9+5] +
        bl2.x * kernelsL[1*72+4*9+6] + bc2.x * kernelsL[1*72+4*9+7] + br2.x * kernelsL[1*72+4*9+8] + 

        tl2.y * kernelsL[1*72+5*9+0] + tc2.y * kernelsL[1*72+5*9+1] + tr2.y * kernelsL[1*72+5*9+2] +
        ml2.y * kernelsL[1*72+5*9+3] + mc2.y * kernelsL[1*72+5*9+4] + mr2.y * kernelsL[1*72+5*9+5] +
        bl2.y * kernelsL[1*72+5*9+6] + bc2.y * kernelsL[1*72+5*9+7] + br2.y * kernelsL[1*72+5*9+8] + 

        tl2.z * kernelsL[1*72+6*9+0] + tc2.z * kernelsL[1*72+6*9+1] + tr2.z * kernelsL[1*72+6*9+2] +
        ml2.z * kernelsL[1*72+6*9+3] + mc2.z * kernelsL[1*72+6*9+4] + mr2.z * kernelsL[1*72+6*9+5] +
        bl2.z * kernelsL[1*72+6*9+6] + bc2.z * kernelsL[1*72+6*9+7] + br2.z * kernelsL[1*72+6*9+8] + 

        tl2.w * kernelsL[1*72+7*9+0] + tc2.w * kernelsL[1*72+7*9+1] + tr2.w * kernelsL[1*72+7*9+2] +
        ml2.w * kernelsL[1*72+7*9+3] + mc2.w * kernelsL[1*72+7*9+4] + mr2.w * kernelsL[1*72+7*9+5] +
        bl2.w * kernelsL[1*72+7*9+6] + bc2.w * kernelsL[1*72+7*9+7] + br2.w * kernelsL[1*72+7*9+8] + biasL[1]
        ,
        tl1.x * kernelsL[2*72+0*9+0] + tc1.x * kernelsL[2*72+0*9+1] + tr1.x * kernelsL[2*72+0*9+2] +
        ml1.x * kernelsL[2*72+0*9+3] + mc1.x * kernelsL[2*72+0*9+4] + mr1.x * kernelsL[2*72+0*9+5] +
        bl1.x * kernelsL[2*72+0*9+6] + bc1.x * kernelsL[2*72+0*9+7] + br1.x * kernelsL[2*72+0*9+8] + 

        tl1.y * kernelsL[2*72+1*9+0] + tc1.y * kernelsL[2*72+1*9+1] + tr1.y * kernelsL[2*72+1*9+2] +
        ml1.y * kernelsL[2*72+1*9+3] + mc1.y * kernelsL[2*72+1*9+4] + mr1.y * kernelsL[2*72+1*9+5] +
        bl1.y * kernelsL[2*72+1*9+6] + bc1.y * kernelsL[2*72+1*9+7] + br1.y * kernelsL[2*72+1*9+8] + 

        tl1.z * kernelsL[2*72+2*9+0] + tc1.z * kernelsL[2*72+2*9+1] + tr1.z * kernelsL[2*72+2*9+2] +
        ml1.z * kernelsL[2*72+2*9+3] + mc1.z * kernelsL[2*72+2*9+4] + mr1.z * kernelsL[2*72+2*9+5] +
        bl1.z * kernelsL[2*72+2*9+6] + bc1.z * kernelsL[2*72+2*9+7] + br1.z * kernelsL[2*72+2*9+8] + 

        tl1.w * kernelsL[2*72+3*9+0] + tc1.w * kernelsL[2*72+3*9+1] + tr1.w * kernelsL[2*72+3*9+2] +
        ml1.w * kernelsL[2*72+3*9+3] + mc1.w * kernelsL[2*72+3*9+4] + mr1.w * kernelsL[2*72+3*9+5] +
        bl1.w * kernelsL[2*72+3*9+6] + bc1.w * kernelsL[2*72+3*9+7] + br1.w * kernelsL[2*72+3*9+8] +

        tl2.x * kernelsL[2*72+4*9+0] + tc2.x * kernelsL[2*72+4*9+1] + tr2.x * kernelsL[2*72+4*9+2] +
        ml2.x * kernelsL[2*72+4*9+3] + mc2.x * kernelsL[2*72+4*9+4] + mr2.x * kernelsL[2*72+4*9+5] +
        bl2.x * kernelsL[2*72+4*9+6] + bc2.x * kernelsL[2*72+4*9+7] + br2.x * kernelsL[2*72+4*9+8] + 

        tl2.y * kernelsL[2*72+5*9+0] + tc2.y * kernelsL[2*72+5*9+1] + tr2.y * kernelsL[2*72+5*9+2] +
        ml2.y * kernelsL[2*72+5*9+3] + mc2.y * kernelsL[2*72+5*9+4] + mr2.y * kernelsL[2*72+5*9+5] +
        bl2.y * kernelsL[2*72+5*9+6] + bc2.y * kernelsL[2*72+5*9+7] + br2.y * kernelsL[2*72+5*9+8] + 

        tl2.z * kernelsL[2*72+6*9+0] + tc2.z * kernelsL[2*72+6*9+1] + tr2.z * kernelsL[2*72+6*9+2] +
        ml2.z * kernelsL[2*72+6*9+3] + mc2.z * kernelsL[2*72+6*9+4] + mr2.z * kernelsL[2*72+6*9+5] +
        bl2.z * kernelsL[2*72+6*9+6] + bc2.z * kernelsL[2*72+6*9+7] + br2.z * kernelsL[2*72+6*9+8] + 

        tl2.w * kernelsL[2*72+7*9+0] + tc2.w * kernelsL[2*72+7*9+1] + tr2.w * kernelsL[2*72+7*9+2] +
        ml2.w * kernelsL[2*72+7*9+3] + mc2.w * kernelsL[2*72+7*9+4] + mr2.w * kernelsL[2*72+7*9+5] +
        bl2.w * kernelsL[2*72+7*9+6] + bc2.w * kernelsL[2*72+7*9+7] + br2.w * kernelsL[2*72+7*9+8] + biasL[2]
        ,
        tl1.x * kernelsL[3*72+0*9+0] + tc1.x * kernelsL[3*72+0*9+1] + tr1.x * kernelsL[3*72+0*9+2] +
        ml1.x * kernelsL[3*72+0*9+3] + mc1.x * kernelsL[3*72+0*9+4] + mr1.x * kernelsL[3*72+0*9+5] +
        bl1.x * kernelsL[3*72+0*9+6] + bc1.x * kernelsL[3*72+0*9+7] + br1.x * kernelsL[3*72+0*9+8] + 

        tl1.y * kernelsL[3*72+1*9+0] + tc1.y * kernelsL[3*72+1*9+1] + tr1.y * kernelsL[3*72+1*9+2] +
        ml1.y * kernelsL[3*72+1*9+3] + mc1.y * kernelsL[3*72+1*9+4] + mr1.y * kernelsL[3*72+1*9+5] +
        bl1.y * kernelsL[3*72+1*9+6] + bc1.y * kernelsL[3*72+1*9+7] + br1.y * kernelsL[3*72+1*9+8] + 

        tl1.z * kernelsL[3*72+2*9+0] + tc1.z * kernelsL[3*72+2*9+1] + tr1.z * kernelsL[3*72+2*9+2] +
        ml1.z * kernelsL[3*72+2*9+3] + mc1.z * kernelsL[3*72+2*9+4] + mr1.z * kernelsL[3*72+2*9+5] +
        bl1.z * kernelsL[3*72+2*9+6] + bc1.z * kernelsL[3*72+2*9+7] + br1.z * kernelsL[3*72+2*9+8] + 

        tl1.w * kernelsL[3*72+3*9+0] + tc1.w * kernelsL[3*72+3*9+1] + tr1.w * kernelsL[3*72+3*9+2] +
        ml1.w * kernelsL[3*72+3*9+3] + mc1.w * kernelsL[3*72+3*9+4] + mr1.w * kernelsL[3*72+3*9+5] +
        bl1.w * kernelsL[3*72+3*9+6] + bc1.w * kernelsL[3*72+3*9+7] + br1.w * kernelsL[3*72+3*9+8] +

        tl2.x * kernelsL[3*72+4*9+0] + tc2.x * kernelsL[3*72+4*9+1] + tr2.x * kernelsL[3*72+4*9+2] +
        ml2.x * kernelsL[3*72+4*9+3] + mc2.x * kernelsL[3*72+4*9+4] + mr2.x * kernelsL[3*72+4*9+5] +
        bl2.x * kernelsL[3*72+4*9+6] + bc2.x * kernelsL[3*72+4*9+7] + br2.x * kernelsL[3*72+4*9+8] + 

        tl2.y * kernelsL[3*72+5*9+0] + tc2.y * kernelsL[3*72+5*9+1] + tr2.y * kernelsL[3*72+5*9+2] +
        ml2.y * kernelsL[3*72+5*9+3] + mc2.y * kernelsL[3*72+5*9+4] + mr2.y * kernelsL[3*72+5*9+5] +
        bl2.y * kernelsL[3*72+5*9+6] + bc2.y * kernelsL[3*72+5*9+7] + br2.y * kernelsL[3*72+5*9+8] + 

        tl2.z * kernelsL[3*72+6*9+0] + tc2.z * kernelsL[3*72+6*9+1] + tr2.z * kernelsL[3*72+6*9+2] +
        ml2.z * kernelsL[3*72+6*9+3] + mc2.z * kernelsL[3*72+6*9+4] + mr2.z * kernelsL[3*72+6*9+5] +
        bl2.z * kernelsL[3*72+6*9+6] + bc2.z * kernelsL[3*72+6*9+7] + br2.z * kernelsL[3*72+6*9+8] + 

        tl2.w * kernelsL[3*72+7*9+0] + tc2.w * kernelsL[3*72+7*9+1] + tr2.w * kernelsL[3*72+7*9+2] +
        ml2.w * kernelsL[3*72+7*9+3] + mc2.w * kernelsL[3*72+7*9+4] + mr2.w * kernelsL[3*72+7*9+5] +
        bl2.w * kernelsL[3*72+7*9+6] + bc2.w * kernelsL[3*72+7*9+7] + br2.w * kernelsL[3*72+7*9+8] + biasL[3]
    ));


    return c5678;
}

//!HOOK LUMA
//!WHEN OUTPUT.w LUMA.w / 1.200 > OUTPUT.h LUMA.h / 1.200 > *
//!DESC ACNet HDN Level 2 L10
//!WIDTH LUMA.w 2 *
//!HEIGHT LUMA.h 2 *
//!BIND L1_1
//!BIND L1_2

const float kernelsL10[4 * 8] = float[4 * 8]
(
 0.4240,  0.4165,
 0.1648,  0.1909,
-0.0985, -0.4455,
 0.4639, -0.0533,
-0.1368,  0.4413,
 0.2539,  0.3294,
 0.2458, -0.3256,
-0.0479,  0.3200,
-0.3977, -0.0422,
-0.2736,  0.1053,
 0.3902,  0.0594,
-0.0721, -0.2988,
 0.0495,  0.1309,
-0.1703,  0.0033,
 0.3061,  0.1827,
 0.2443, -0.1259
);

vec4 hook()
{
    vec2 fcoord = fract(L1_1_pos * L1_1_size);
    vec2 pos = L1_1_pos + (vec2(0.5) - fcoord) * L1_1_pt;

    ivec2 icoord = ivec2(fcoord * vec2(2));
    int inedx = icoord.y * 2 + icoord.x;

    vec4 mc1 = L1_1_tex(pos);
    vec4 mc2 = L1_2_tex(pos);

    float luma = clamp(
        mc1.x * kernelsL10[0 + inedx] +
        mc1.y * kernelsL10[4 + inedx] +
        mc1.z * kernelsL10[8 + inedx] +
        mc1.w * kernelsL10[12 + inedx] +
        mc2.x * kernelsL10[16 + inedx] +
        mc2.y * kernelsL10[20 + inedx] +
        mc2.z * kernelsL10[24 + inedx] +
        mc2.w * kernelsL10[28 + inedx], 0.0f, 1.0f);
    
    return vec4(luma, 0.0f, 0.0f, 1.0f);
}
