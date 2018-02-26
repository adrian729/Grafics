#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix, modelViewMatrix;
uniform mat3 normalMatrix;

uniform vec4 lightAmbient, lightDiffuse, lightSpecular, lightPosition;
uniform vec4 matAmbient, matDiffuse, matSpecular;
uniform float matShininess;

vec4 blinnPhong() {
  vec3 N = normalize(normalMatrix*normal);
  vec3 P = (modelViewMatrix*vec4(vertex, 1.0)).xyz;
  vec3 V = vec3(0, 0, 1);
  vec3 L = normalize(lightPosition.xyz - P);
  vec3 H = normalize(V + L);
  return matAmbient*lightAmbient
    + matDiffuse*lightDiffuse*max(0.0, dot(N, L))
    + matSpecular*lightSpecular*pow(max(0.0, dot(N, H)), matShininess);
}

void main()
{
    frontColor = blinnPhong();
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
