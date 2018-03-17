#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

uniform float n = 8;

void main() {
    fragColor = vec4(1, 0, 0, 1);
    float s = fract(vtexCoord.s*n);
    float t = fract(vtexCoord.t*n);
    if(s >= 0.1 && t >= 0.1)
        discard;
}
