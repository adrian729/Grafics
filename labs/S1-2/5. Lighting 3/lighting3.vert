#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;

out vec3 vnorm, pfrag;

uniform mat4 modelViewMatrix, modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main() {
    vnorm = normalMatrix*normal;
    pfrag = (modelViewMatrix*vec4(vertex, 1.0)).xyz;
    gl_Position = modelViewProjectionMatrix*vec4(vertex, 1.0);
}
