#version 330 core

in vec4 frontColor;
in vec3 vtex;
out vec4 fragColor;

void main() {
    fragColor = frontColor*normalize(cross(dFdx(vtex), dFdy(vtex))).z;
}
