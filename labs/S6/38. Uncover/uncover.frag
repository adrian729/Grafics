#version 330 core

in vec4 vert;
out vec4 fragColor;

uniform float time;

void main() {
    if(vert.x/vert.w > time - 1) discard;
    fragColor = vec4(0, 0, 1, 1);
}
