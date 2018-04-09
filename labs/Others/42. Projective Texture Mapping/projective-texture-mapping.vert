#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec2 vtexCoord;
out vec3 norm;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main() {
    norm = normalMatrix*normal;
    vec4 vert = modelViewProjectionMatrix*vec4(vertex, 1);
    vtexCoord = vert.xy/vert.w;
    gl_Position = vert;
}