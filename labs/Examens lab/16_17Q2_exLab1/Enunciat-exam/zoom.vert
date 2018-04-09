#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewMatrix, projectionMatrix;
uniform mat3 normalMatrix;

uniform float time;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

void main()
{
    vec3 d = boundingBoxMax - boundingBoxMin;
    float r = sqrt(pow(d.x,2.0) + pow(d.y,2.0) + pow(d.z,2.0)) / 2.0;   

    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0) * N.z;
    vtexCoord = texCoord;
    vec4 zoomedVertex = modelViewMatrix * vec4(vertex,1.0);
    zoomedVertex.z += vec3(r*sin(time) / 2.0);
    gl_Position = projectionMatrix * zoomedVertex;
}
