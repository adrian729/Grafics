#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec3 vtex;

uniform mat4 modelViewProjectionMatrix, modelViewMatrix;

uniform float time;

void main() {
    float phi = 0.1*time;
    float s = sin(phi);
    float c = cos(phi);
    mat3 rot = mat3(
        vec3(c, 0, -s),
        vec3(0, 1, 0),
        vec3(s, 0, c)
    );
    vec3 v = rot*vertex;
    vtex = (modelViewMatrix*vec4(v, 1)).xyz;
    gl_Position = modelViewProjectionMatrix*vec4(v, 1.0);
}
