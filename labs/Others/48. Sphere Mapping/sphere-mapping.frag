#version 330 core

in vec3 norm, vert, obs;
out vec4 fragColor;

uniform vec4 lightPosition;

uniform sampler2D sampler;

vec4 sampleSphereMap(sampler2D sampler, vec3 R) {
    float z = sqrt((R.z + 1)/2.0);
    vec2 st = vec2((R.x/(2.0*z) + 1)/2.0, (R.y/(2.0*z) + 1)/2.0);
    return texture(sampler, st);
}

void main() {
    vec3 N = normalize(norm);
    vec3 V = normalize(obs - vert);
    float dotNL = dot(N, V);
    vec3 R = 2.0*dotNL*N - V;
    fragColor = sampleSphereMap(sampler, R);
}
