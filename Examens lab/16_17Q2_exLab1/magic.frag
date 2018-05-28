#version 330 core

in vec2 vtexCoord;
in vec3 norm;
out vec4 fragColor;

uniform sampler2D window;
uniform sampler2D interior1;
uniform sampler2D exterior2;

void main() {
    fragColor = texture(window, vtexCoord);
    if(fragColor.a < 1.0) {
        fragColor = texture(interior1, vtexCoord + 0.5*norm.xy);
        if(fragColor.a < 1.0) fragColor = texture(exterior2, vtexCoord + 0.7*norm.xy);
    }
}
