#version 330 core

in vec3 vert;
out vec4 fragColor;

uniform mat4 modelViewMatrixInverse;

uniform sampler2D spheremap;

vec4 sampleSphereMap(sampler2D sampler, vec3 V) {
    float z = sqrt((V.z +  1)/2.0);
    vec2 st = V.xy/(4.0*z) + 0.5;
    return texture(sampler, st);
}

void main() {
    vec3 obs = (modelViewMatrixInverse*vec4(0, 0, 0, 1)).xyz;
    vec3 V = normalize(vert - obs);
    fragColor = sampleSphereMap(spheremap, V);
}
