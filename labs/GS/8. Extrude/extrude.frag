#version 330 core

in vec4 gfrontColor;
out vec4 fragColor;

uniform mat3 normalMatrix;

void main() {
    fragColor = vec4(normalize(normalMatrix*gfrontColor.xyz).z);
}
