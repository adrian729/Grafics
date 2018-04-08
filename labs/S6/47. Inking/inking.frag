#version 330 core

in vec2 vtexCoord;
in vec4 frontColor;
out vec4 fragColor;

uniform sampler2D sampler;

uniform int textureSize = 1024;
uniform int edgeSize = 2;
uniform float threshold = 0.1;

void main() {
    vec2 left, right, bottom, top;
    left = vtexCoord + edgeSize*vec2(-1, 0)/textureSize;
    right = vtexCoord + edgeSize*vec2(1, 0)/textureSize;
    bottom = vtexCoord + edgeSize*vec2(0, -1)/textureSize;
    top = vtexCoord + edgeSize*vec2(0, 1)/textureSize;
    float GX = length(texture(sampler, right) - texture(sampler, left));
    float GY = length(texture(sampler, top) - texture(sampler, bottom));
    fragColor = texture(sampler, vtexCoord);
    if(length(vec2(GX, GY)) > threshold) fragColor = vec4(0, 0, 0, 1);
}
