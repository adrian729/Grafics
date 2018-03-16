#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform float time;

void main() {
    float phi = 0.4*vertex.y*sin(time);
    frontColor = vec4(color, 1.0);
    float s = sin(phi);
    float c = cos(phi);
    mat3 mrot = mat3(
        vec3(c, 0, -s),
        vec3(0, 1, 0),
        vec3(s, 0, c)
    );
    gl_Position = modelViewProjectionMatrix*vec4(mrot*vertex, 1.0);
}
