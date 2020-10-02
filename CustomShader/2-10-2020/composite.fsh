#version 120

#include "/lib/framebuffer.glsl"

varying vec4 texcoord;
varying vec3 lightVector;

/* DRAW BUFFERS : 012 */

void main() {
  vec3 albedo = getAlbedo(texcoord.st);
  vec3 normal = getNormal(texcoord.st);
  float emission = getEmission(texcoord.st);

  float sunLightStrength = dot(normal, lightVector);
  sunLightStrength = max(0.0, sunLightStrength);

  float ambientLight = 0.37;

  vec3 litColor = albedo * (sunLightStrength + ambientLight);
  vec3 finalColor = mix(litColor, albedo, emission);

  GCOLOR_OUT = vec4(finalColor, 1.0);
}
