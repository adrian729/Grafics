#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

uniform float n = 8;

void main() {
    fragColor = vec4(1, 0, 0, 1);
    float s = fract(vtexCoord.s*n);
    vec2 st = fract(vtexCoord*n);
    if(st.s >= 0.1 && st.t >= 0.1)
        discard;
}

