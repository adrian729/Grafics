#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D skeleton;

void main() {
    fragColor = vec4(1) - texture(skeleton, vtexCoord);
}
