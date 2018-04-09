#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 2) in vec3 color;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;

void main() {
    frontColor = vec4(color,1.0);
    vec4 v = modelViewProjectionMatrix*vec4(vertex, 1.0);
    v.z = -v.z;
    gl_Position = v;
}
