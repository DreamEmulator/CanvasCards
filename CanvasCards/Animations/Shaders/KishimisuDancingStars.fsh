/* "Dancing Stars" by @kishimisu (2023) - https://www.shadertoy.com/view/DtjGWd
 [232 chars => 229 chars by @iapafoto]

 Alternative version of my shader "Dancing Dots" that I made for twitter.

 This one is a perfect loop of 4*pi seconds and has a nice star pattern!
 I also took into account the code-golfing comments pointed out by
 @FabriceNeyret2 and @coyote in the previous version (see fork).
 */

void main() {
  vec2 u = v_tex_coord*u_sprite_size;
  vec2 iResolution = u_sprite_size;
  vec4 O = 1.;
  float iTime = u_time;

  vec2 r = iResolution.xy; u += u - r;
  float i = 0.;

  for (O *= i; i < 8.; i += .05)
    u *= mat2(cos(2.5+vec4(0,33,11,0)).x, cos(2.5+vec4(0,33,11,0)).y, cos(2.5+vec4(0,33,11,0)).z, cos(2.5+vec4(0,33,11,0)).w),
    O += pow(
             .01/length(u/r.y/.3+sin(i+vec2(iTime*.5,iTime+1.6)))
             *(cos(i*6.+vec4(0,1,2,0))+1.), O-O+1.45);
  gl_FragColor = O;
}
