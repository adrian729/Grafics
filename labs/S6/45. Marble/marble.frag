#version 330 core

in vec3 norm;
in vec4 vert;
out vec4 fragColor;

uniform mat4 modelViewMatrix;

uniform sampler2D noise;

vec4 shading(vec3 N, vec3 Pos, vec4 diffuse) {
    vec3 lightPos = vec3(0, 0, 2);
    vec3 L = normalize(lightPos - Pos);
    vec3 V = normalize(-Pos);
    vec3 R = reflect(-L, N);
    float NdotL = max(0, dot(N, L));
    float RdotV = max(0, dot(R, V));
    float Ispec = pow(RdotV, 20);
    return diffuse*NdotL + Ispec;
}

void main() {
    vec4 PS = vec4(0, 0.3, -0.3, 0);
    vec4 PT = vec4(-0.6, -0.3, 0.3, 0);
    float s = dot(PS, vert);
    float t = dot(PT, vert);
    float v = texture(noise, vec2(s, t)).r;
    vec4 white = vec4(1);
    vec4 redish = vec4(0.5, 0.2, 0.2, 1);
    vec4 diffuse = v < 0.5 ? mix(white, redish, 2*v) : mix(redish, white, 2*(v - 0.5));
    fragColor = shading(norm, (modelViewMatrix*vert).xyz, diffuse);
}
