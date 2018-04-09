#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;

out vec3 norm, vert, obs;

uniform mat4 modelViewProjectionMatrix, modelViewMatrix, modelViewMatrixInverse;
uniform mat3 normalMatrix;

uniform bool worldSpace = false;

void main() {
    norm = normal;
    vert = vertex;
    obs = worldSpace ? (modelViewMatrixInverse*vec4(0, 0, 0, 1)).xyz : vec3(0);
    if(!worldSpace) {
        norm = normalMatrix*norm;
        vert = (modelViewMatrix*vec4(vert, 1)).xyz;
    }
    gl_Position = modelViewProjectionMatrix*vec4(vertex, 1.0);
}
