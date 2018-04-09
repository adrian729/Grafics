#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

void main() {
    fragColor = vec4(1, 0, 0, 0);
    if(mod(int(fract(vtexCoord.s)*9), 2) == 0) fragColor = vec4(1, 1, 0, 0);
}
