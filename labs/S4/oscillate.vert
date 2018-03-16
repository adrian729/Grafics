#version 330 core

#define M_PI 3.1415926535897932384626433832795

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix, modelViewMatrix;
uniform mat3 normalMatrix;
uniform vec3 boundingBoxMax, boundingBoxMin;
uniform float time;
uniform bool eyespace = true;

void main() {
    frontColor = vec4(color, 1.0);
    float r = distance(boundingBoxMax, boundingBoxMin)/2.0;
    float y = eyespace ? (modelViewMatrix*vec4(vertex, 1.0)).y : vertex.y;
    float d = (r/10.0)*y;
    vec3 osc = normal*d*sin(time);
    gl_Position = modelViewProjectionMatrix*vec4(vertex + osc, 1.0);
}
