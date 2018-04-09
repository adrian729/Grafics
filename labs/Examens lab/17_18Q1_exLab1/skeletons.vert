#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 3) in vec2 texCoord;

out vec2 vtexCoord;

uniform int tiles = 1;
uniform float time;

void main() {
    vtexCoord = texCoord*tiles;
    float offset = floor(30*time);
    vtexCoord.s = (vtexCoord.s + offset)/44;
    gl_Position = vec4(vertex, 1.0);
}
