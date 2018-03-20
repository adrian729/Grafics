#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

void main() {
    fragColor = vec4(1, 1, 1, 1);
    if(distance(vtexCoord, vec2(0.5, 0.5)) <= 0.2)
        fragColor = vec4(1, 0, 0, 1);
}
