#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;

out vec3 N, V, L;

uniform mat4 modelViewProjectionMatrix, modelViewMatrix, viewMatrixInverse;
uniform mat3 normalMatrix;
uniform vec4 lightPosition;

uniform bool world = true;

void main() {
    if(world) {
        N = normal;
        // P = vertex;
        V = (viewMatrixInverse*vec4(0,0,0,1)).xyz - vertex;
        L = (viewMatrixInverse*lightPosition).xyz - vertex;
    }
    else {
        N = normalMatrix*normal;
        vec3 P = (modelViewMatrix*vec4(vertex, 1)).xyz;
        V = -P;
        L = lightPosition.xyz - P;
    }
    gl_Position = modelViewProjectionMatrix*vec4(vertex, 1.0);
}
