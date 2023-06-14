/* Neon Core by @kishimisu (2023) - https://www.shadertoy.com/view/dlc3Wl
 [289 chars]

 There's only one "real" sphere, all others are mirror versions
 */

#define M(p) p *= mat2(cos(round((atan(p.x,p.y)+k)/.3)*.3-k + vec4(0,33,11,0))),//
#define L length(p)//

void main() {
  vec2 F = v_tex_coord*u_sprite_size;
  vec2 iResolution = u_sprite_size;
  vec4 O;
  float iTime = u_time;
  vec3  p;
  vec3 R = vec3(iResolution,1.0);
  float t, k = iTime*.2;

  for (O *= t;
       O.a++ < 30.;
       O += (1. + cos(k+k+t+vec4(0,1,2,0))) / 2e2 / L
       )
    p = R - vec3(F+F, R.y),
    p = t/L*p - 3./R,
    M(p.zx) M(p.yx)
    p.x -= 2., t -= L - .1;
}
