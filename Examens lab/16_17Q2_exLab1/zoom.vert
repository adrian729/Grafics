#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;

out vec4 frontColor;

uniform mat4 projectionMatrix, modelViewMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin, boundingBoxMax;
uniform float time;

void main() {
    float r = 0.25*distance(boundingBoxMax, boundingBoxMin);
    float d = r*sin(time);
    frontColor = vec4(color,1.0)*normalize(normalMatrix*normal).z;
    vec4 v = modelViewMatrix*vec4(vertex, 1.0);
    v.z += d;
    gl_Position = projectionMatrix*v;
}
