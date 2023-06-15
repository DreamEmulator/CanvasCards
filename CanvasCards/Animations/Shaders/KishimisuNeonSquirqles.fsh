/* "Neon Squircles" by @kishimisu (2022) - https://www.shadertoy.com/view/mdjXRd
 [262 chars]

 No raymarching this time as I wanted to stay
 below 300 chars, I tried to reduce the number
 of instructions to the minimum to avoid having
 a body with brackets in the for loop.

 The layout of the code was inspired by @Xor's
 codegolfing shaders: for(..; ..; O.rgb += *magic*);
 */
void main(){
  vec2 F = v_tex_coord*u_sprite_size;
  vec2 iResolution = u_sprite_size;
  vec4 O = vec4(1.);
  float iTime = u_time;
  vec2 r = iResolution.xy, u = (F+F-r)/r.y;
  vec3 finalColor = vec3(0.0);

  O.xyz*=0.;
  vec4 rotation;
  for (float i = 0.0; i < 20.0; i++) {
    rotation = cos((iTime + i) * 0.03 + vec4(0.0, 33.0, 11.0, 0.0));
    u *= mat2(rotation.x, rotation.y, rotation.z, rotation.w);
    O.xyz += (.004 / (abs(length(u * u) - i * 0.04) + 0.005)) *   // shape distance
    ((cos(i + vec3(0.0, 1.0, 2.0)) + 1.0) *                  // color
     smoothstep(0.35, 0.4, abs(abs(mod(iTime, 2.0) - i * 0.1) - 1.0)));  // animation
  }
  finalColor = O.xyz;
//  gl_FragColor = u_darkMode == 1.0 ? vec4(finalColor, 1.0) : vec4(1-finalColor.x, 1-finalColor.y, 1-finalColor.z,1.0);
  gl_FragColor = vec4(finalColor, 1.0);
}
