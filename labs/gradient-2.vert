#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform vec3 boundingBoxMin, boundingBoxMax;

float scalator(float value, float maxVal, float minVal) {
    return (value - minVal)/(maxVal - minVal);
}

void main() {
    vec4 red = vec4(1, 0, 0, 1);
    vec4 yellow = vec4(1, 1, 0, 1);
    vec4 green = vec4(0, 1, 0, 1);
    vec4 cian = vec4(0, 1, 1, 1);
    vec4 blue = vec4(0, 0, 1, 1);

    vec4 v = modelViewProjectionMatrix*vec4(vertex, 1.0);
    float y = v.y/v.w;

    float minSc = -1;
    float maxSc = -0.5;
    vec4 color1 = red;
    vec4 color2 = yellow;
    if(y > 0.5) {
        minSc = 0.5;
        maxSc = 1;
        color1 = cian;
        color2 = blue;
    }
    else if(y > 0) {
        minSc = 0;
        maxSc = 0.5;
        color1 = green;
        color2 = cian;
    }
    else if(y > -0.5) {
        minSc = -0.5;
        maxSc = 0;
        color1 = yellow;
        color2 = green;
    }

    frontColor = mix(color1, color2, scalator(y, maxSc, minSc));
    gl_Position = modelViewProjectionMatrix*vec4(vertex, 1.0);
}
