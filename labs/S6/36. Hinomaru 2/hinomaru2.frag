#version 330 core

#define M_PI 3.1415926535897932384626433832795

in vec2 vtexCoord;
out vec4 fragColor;

uniform bool classic = true;

void main() {
    fragColor = vec4(1, 1, 1, 1);
    vec2 u = vtexCoord - vec2(0.5);
    float theta = atan(u.s, u.t);
    float phi = M_PI/16;
    if(distance(vtexCoord, vec2(0.5, 0.5)) <= 0.2)
        fragColor = vec4(1, 0, 0, 1);
    else if(classic && mod(theta/phi + 0.5, 2) < 1)
        fragColor = vec4(1, 0, 0, 1);
}
