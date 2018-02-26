#version 330 core

in vec3 vnorm, pfrag;
out vec4 fragColor;

uniform vec4 lightAmbient, lightDiffuse, lightSpecular, lightPosition;
uniform vec4 matAmbient, matDiffuse, matSpecular;
uniform float matShininess;

vec4 blinnPhong() {
  vec3 N = normalize(vnorm);
  vec3 P = pfrag;
  vec3 V = vec3(0, 0, 1);
  vec3 L = normalize(lightPosition.xyz - P);
  vec3 H = normalize(V + L);
  return matAmbient*lightAmbient
    + matDiffuse*lightDiffuse*max(0.0, dot(N, L))
    + matSpecular*lightSpecular*pow(max(0.0, dot(N, H)), matShininess);
}

void main()
{
    fragColor = blinnPhong();
}
