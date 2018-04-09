#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;

out vec3 norm;
out vec4 vert;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main() {
    vert = vec4(vertex, 1);
    norm = normalMatrix*normal;
    gl_Position = modelViewProjectionMatrix*vec4(vertex, 1.0);
}
