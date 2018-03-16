#version 330 core

in vec4 frontColor;
in vec3 V;
out vec4 fragColor;

void main() {
    vec3 x = dFdx(V);
    vec3 y = dFdy(V);
    fragColor = frontColor*normalize(x+y).z;
}
