#version 330 core

in vec3 norm, vert, obs;
out vec4 fragColor;

uniform sampler2D glossy;
uniform vec4 lightPosition;
uniform int r = 5;

vec4 sampleTexture(sampler2D sampler, vec2 st, int r) {
    r = min(max(0, r), 40);
    vec2 wh = vec2(512, 512);
    vec4 C = vec4(0);
    for(int i = -r; i <= r; ++i) {
        for(int j = -r; j <= r; ++j) {
            C += texture(glossy, vec2(st.s + i/wh.x, st.t + j/wh.y));
        }
    }
    C = C/((2*r + 1)*(2*r + 1));
    return C;
}

vec4 sampleSphereMap(sampler2D sampler, vec3 R) {
    float z = sqrt((R.z + 1)/2.0);
    vec2 st = vec2((R.x/(2.0*z) + 1)/2.0, (R.y/(2.0*z) + 1)/2.0);
    return sampleTexture(sampler, st, r);
}

void main() {
    vec3 N = normalize(norm);
    vec3 V = normalize(vert - obs);
    vec3 R = reflect(V, N);
    fragColor = sampleSphereMap(glossy, R);
}
