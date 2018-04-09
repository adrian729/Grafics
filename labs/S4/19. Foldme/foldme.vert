#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;

uniform float time;

void main() {
    float phi = -time*texCoord.s;
    float s = sin(phi);
    float c = cos(phi);
    mat3 m = mat3(
        vec3(c, 0, -s),
        vec3(0, 1, 0),
        vec3(s, 0, c)
    );
    frontColor = vec4(0, 0, 1, 1);
    gl_Position = modelViewProjectionMatrix*vec4(m*vertex, 1.0);
}
