#version 330 core

layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform vec2 Min = vec2(-2, -2);
uniform vec2 Max = vec2(2, 2);

float scalator(float value, float minVal, float maxVal) {
    return (value - minVal)/(maxVal - minVal);
}

void main() {
    frontColor = vec4(color, 1.0);
    vec2 st = 2*(texCoord - Min)/(Max - Min) - 1;
    gl_Position = vec4(st, 0, 1);
}

