#version 330 core

in vec4 frontColor;
in vec3 N;
out vec4 fragColor;

uniform mat3 normalMatrix;

void main() {
    fragColor = frontColor*normalize(normalMatrix*N).z;
}
