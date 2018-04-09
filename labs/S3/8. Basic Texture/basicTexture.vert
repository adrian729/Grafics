#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 3) in vec2 texCoord;

out vec2 vtexCoord;
out vec4 frontColor;

uniform mat3 normalMatrix;
uniform mat4 modelViewProjectionMatrix;

void main() {
    frontColor = vec4(normalize(normalMatrix*normal).z);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix*vec4(vertex, 1.0);
}
