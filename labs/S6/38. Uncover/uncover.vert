#version 330 core

layout (location = 0) in vec3 vertex;

out vec4 vert;

uniform mat4 modelViewProjectionMatrix;

void main() {
    vert = modelViewProjectionMatrix*vec4(vertex, 1.0);
    gl_Position = vert;
}
