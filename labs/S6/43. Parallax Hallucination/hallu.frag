#version 330 core

#define M_PI 3.1415926535897932384626433832795

in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D map;

uniform float time;
uniform float a = 1.0;

void main() {
    vec4 text = texture(map, vtexCoord);
    float m = max(text.r, text.g);
    m = max(m, text.b);
    float theta = 2*M_PI*time;
    float s = sin(theta);
    float c = cos(theta);
    mat2 rot = mat2(
        vec2(c, s),
        vec2(-s, c)
    );
    vec2 offset = (a/100.0)*rot*vec2(m);
    fragColor = texture(map, vtexCoord + offset);
}
