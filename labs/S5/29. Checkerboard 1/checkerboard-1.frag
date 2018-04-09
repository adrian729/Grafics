#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

void main() {
    fragColor = vec4(0, 0, 0, 1);
    vec2 st = fract(vtexCoord)*8.0;
    if(mod(int(st.s) + int(st.t), 2) == 0)
        fragColor = vec4(0.8, 0.8, 0.8, 1);
}
