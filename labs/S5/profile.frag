#version 330 core

in vec4 frontColor;
in vec3 N, V;
out vec4 fragColor;

uniform float epsilon = 0.1;
uniform float light = 0.5;

void main() {
    fragColor = frontColor*light*normalize(N).z;
    if(abs(dot(normalize(V), normalize(N))) < epsilon) fragColor = vec4(0.7, 0.6, 0, 1);
}
