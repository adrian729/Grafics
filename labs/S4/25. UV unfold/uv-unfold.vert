#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform vec2 Min = vec2(-1, -1);
uniform vec2 Max = vec2(1, 1);

float scalator(float value, float maxVal, float minVal) {
    return (value - minVal)/(maxVal - minVal);
}

void main() {
    frontColor = vec4(color, 1.0);
    float s = scalator(texCoord.s, 1, 0);
    float t = scalator(texCoord.t, 1, 0);
    gl_Position = vec4(s, t, 0, 1);
}
