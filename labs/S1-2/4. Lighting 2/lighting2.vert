#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix, modelViewMatrix;
uniform mat3 normalMatrix;

uniform vec4 lightAmbient, lightDiffuse, lightSpecular, lightPosition;
uniform vec4 matAmbient, matDiffuse, matSpecular;
uniform float matShininess;

vec4 phong() {
  vec3 N = normalize(normalMatrix*normal);
  vec3 P = (modelViewMatrix*vec4(vertex, 1.0)).xyz;
  vec3 V = normalize(-P); // obs a (0, 0, 0)
  vec3 L = normalize(lightPosition.xyz - P);
  float dotNL = max(0.0, dot(N, L));
  vec3 R = 2.0*dotNL*N - L;
  float RVS = dotNL > 0 ? pow(max(0.0, dot(R, V)), matShininess) : 0;
  return matAmbient*lightAmbient
    + matDiffuse*lightDiffuse*dotNL
    + matSpecular*lightSpecular*RVS;
}

void main() {
    frontColor = phong();
    gl_Position = modelViewProjectionMatrix*vec4(vertex, 1.0);
}
