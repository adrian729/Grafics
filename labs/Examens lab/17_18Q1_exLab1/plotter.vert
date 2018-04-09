#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;

uniform float xmin = -6;
uniform float xmax = 6;
uniform float ymin = -2;
uniform float ymax = 2;

void main()
{
    float Y = 0.;
    vec3 nVertex = vertex;
    if(vertex.z == -2. || vertex.z == 0. || vertex.z == 2.) {
        float normX = sqrt(xmax*xmax + xmin*xmin);
        float normY = sqrt(ymax*ymax + ymin*ymin);
        float originX = (xmin + xmax) / 2.;
        float originY = (ymin + ymax) / 2.;
        nVertex.x = normX * nVertex.x + originX;
        nVertex.y = normY * nVertex.y + originY;
        if(vertex.z == -2.) {
            Y = sin(nVertex.x);
            frontColor = vec4(1., 0., 0., 1.0);
        }
        else if(vertex.z == 0.) {
            Y = 2*exp(-nVertex.x*nVertex.x/6.);
            frontColor = vec4(0., 1., 0., 1.0);
        }
        else {
            Y = sin(2*nVertex.x);
            frontColor = vec4(0., 0., 1., 1.0);
        }
    }
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(nVertex.x, nVertex.y + Y, 0., 1.0);
}
