// #define CV_VFP 0

// #if __ARM_ARCH >= 7 && defined __VFP_FP__ && !defined __SOFTFP__
#if defined __GNUC__ && defined __arm__ && (defined __ARM_PCS_VFP || defined __ARM_VFPV3__ || defined __ARM_NEON__) && !defined __SOFTFP__
#define CV_VFP 1
#endif

// #if defined __GNUC__ && defined __arm__ && (defined __ARM_PCS_VFP || defined __ARM_VFPV3__ || defined __ARM_NEON__) && !defined __SOFTFP__
// // #if defined __GNUC__ && defined __arm__ && (defined __ARM_PCS_VFP || defined __ARM_VFPV3__)
// // #if defined __GNUC__ && defined __arm__ && (defined __ARM_PCS_VFP || defined __ARM_VFPV3__ || defined __ARM_NEON__) && !defined __SOFTFP__
// // #if defined __GNUC__ && defined __arm__ && (defined __ARM_PCS_VFP || defined __ARM_VFPV3__ || defined __ARM_VFPV4__ || defined __ARM_NEON_FP) && !defined __SOFTFP__
// #define CV_VFP 1
// #endif

#ifdef CV_VFP

// 1. general scheme
#define ARM_ROUND(_value, _asm_string) \
    int res; \
    float temp; \
    asm(_asm_string : [res] "=r" (res), [temp] "=w" (temp) : [value] "w" (_value)); \
    return res
// 2. version for double
#ifdef __clang__
    #define ARM_ROUND_DBL(value) ARM_ROUND(value, "vcvtr.s32.f64 %[temp], %[value] \n vmov %[res], %[temp]")
#else
    #define ARM_ROUND_DBL(value) ARM_ROUND(value, "vcvtr.s32.f64 %[temp], %P[value] \n vmov %[res], %[temp]")
#endif
// 3. version for float
#define ARM_ROUND_FLT(value) ARM_ROUND(value, "vcvtr.s32.f32 %[temp], %[value]\n vmov %[res], %[temp]")

int cvRound( double value );

int cvRound( double value )
{
    ARM_ROUND_DBL(value);
}

#warning Experimental round is enabled

#endif
