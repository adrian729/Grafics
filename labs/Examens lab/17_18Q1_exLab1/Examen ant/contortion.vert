#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;

uniform float time;

void main()
{
    vec3 nVertex = vertex;
    if(vertex.y >= 0.5) {
        float angleA = (vertex.y-0.5)*sin(time);
        mat3 rotation = mat3( vec3(1., 0., 0.), vec3(0., cos(angleA), sin(angleA)), vec3(0., -sin(angleA), cos(angleA)));
        vec3 eixX = vec3(0., 1., 0.);
        nVertex = (rotation*(nVertex - eixX)) + eixX;
    }    
    frontColor = vec4(color,1.0);
    gl_Position = modelViewProjectionMatrix * vec4(nVertex, 1.0);
}
