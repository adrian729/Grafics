#version 330 core

in vec3 vert;
out vec4 fragColor;

uniform vec3 origin = vec3(0, 0, 0);
uniform vec3 axis = vec3(0, 0, 1);
uniform float slice = 0.05;

void main() {
    fragColor = vec4(0, 0, 1, 1);
    float d = distance(vert, origin + axis*dot(vert, axis));
    if(mod(int(d/slice), 2) == 0) fragColor = vec4(0, 1, 1, 1);
}
