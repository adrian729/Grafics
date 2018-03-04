#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float time;
uniform float amplitude = 0.1;
uniform float freq = 1;

#define M_PI 3.1415926535897932384626433832795

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(N.z);
    vec3 nvert = vertex + normal*amplitude*sin(2*M_PI*freq*time);
    gl_Position = modelViewProjectionMatrix * vec4(nvert, 1.0);
}
