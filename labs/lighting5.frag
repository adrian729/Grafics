#version 330 core

in vec3 N, V, L;
out vec4 fragColor;

uniform vec4 lightAmbient, lightDiffuse, lightSpecular, lightPosition;
uniform vec4 matAmbient, matDiffuse, matSpecular;
uniform float matShininess;

uniform mat4 modelViewProjectionMatrix, modelViewMatrix;
uniform mat3 normalMatrix;

vec4 light(vec3 N, vec3 V, vec3 L) {
    N = normalize(N);
    V = normalize(V);
    L = normalize(L);
    vec3 R = normalize(2.0*dot(N, L)*N - L);
    float NdotL = max(0.0, dot(N, L));
    float RdotV = max(0.0, dot(R,V));
    float Idiff = NdotL;
    float Ispec = 0;
    if (NdotL > 0) Ispec = pow(RdotV, matShininess);
    return matAmbient*lightAmbient
        + matDiffuse*lightDiffuse*Idiff
        + matSpecular*lightSpecular*Ispec;
}

void main()
{
    fragColor = light(N, V, L);
}
