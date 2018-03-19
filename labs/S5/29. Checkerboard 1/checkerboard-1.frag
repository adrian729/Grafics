#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

void main() {
    fragColor = vec4(0, 0, 0, 1);
    int s = int(fract(vtexCoord.s)*8.0);
    int t = int(fract(vtexCoord.t)*8.0);
    if(mod(s + t, 2) == 0)
        fragColor = vec4(0.8, 0.8, 0.8, 1);
}
