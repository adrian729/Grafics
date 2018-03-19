#version 330 core

in vec3 vnorm, pfrag;
out vec4 fragColor;

uniform vec4 lightAmbient, lightDiffuse, lightSpecular, lightPosition;
uniform vec4 matAmbient, matDiffuse, matSpecular;
uniform float matShininess;

vec4 phong() {
  vec3 N = normalize(vnorm);
  vec3 P = pfrag;
  vec3 V = normalize(-P);
  vec3 L = normalize(lightPosition.xyz - P);
  float dotNL = max(0.0, dot(N, L));
  vec3 R = 2.0*dotNL*N - L;
  float RVS = dotNL > 0 ? pow(max(0.0, dot(R, V)), matShininess) : 0;
  return matAmbient*lightAmbient
    + matDiffuse*lightDiffuse*dotNL
    + matSpecular*lightSpecular*RVS;
}

void main() {
    fragColor = phong();
}
