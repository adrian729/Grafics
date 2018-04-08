#version 330 core

in vec3 vtex;
out vec4 fragColor;

uniform sampler2D sampler;

void main() {
    vec3 n = normalize(cross(dFdx(vtex), dFdy(vtex)));
    fragColor = texture(sampler, vec2(n.x, n.y))*n.z;
}
