//!DESC acme-0.5x
//!HOOK LUMA
//!BIND HOOKED
//!WIDTH HOOKED.w 2 /
//!HEIGHT HOOKED.h 2 /
//!WHEN HOOKED.w 16777216 + 16777216 - HOOKED.w - ! HOOKED.h 16777216 + 16777216 - HOOKED.h - ! *
//!OFFSET 0.25 0.25
vec4 hook() {
    return HOOKED_texOff(vec2(-0.25,-0.25));
}
