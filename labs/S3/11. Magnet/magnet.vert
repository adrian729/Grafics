#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix, modelViewMatrixInverse;
uniform mat3 normalMatrix;
uniform vec4 lightPosition;

uniform float n = 4;

void main() {
    vec3 F = (modelViewMatrixInverse*lightPosition).xyz;
    float d = distance(vertex, F);
    float w = clamp(1.0/pow(d, n), 0, 1);
    vec3 newVert = (1.0 - w)*vertex + w*F;
    frontColor = vec4(normalize(normalMatrix*normal).z);
    gl_Position = modelViewProjectionMatrix*vec4(newVert, 1.0);
}
