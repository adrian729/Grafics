#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 2) in vec3 color;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float xmin = -6;
uniform float xmax = 6;
uniform float ymin = -2;
uniform float ymax = 2;

void main() {
    float x = 0.5*(xmax - xmin)*(vertex.x + 1) + xmin;
    float y = 0;
    if(vertex.z == -2){
        y = sin(x);
        frontColor = vec4(1, 0, 0, 1);
    }
    else if(vertex.z == 0) {
        y = 2*exp(-x*x/6.0);
        frontColor = vec4(0, 1, 0, 1);
    }
    else if(vertex.z == 2) {
        y = sin(2*x);
        frontColor = vec4(0, 0, 1, 1);
    }
    y = 2.0*(y - ymin)/(ymax - ymin) - 1;
    gl_Position = vec4(vertex.x, vertex.y + y, 0, 1.0);
}
