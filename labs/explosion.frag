#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D explosion;

uniform float time;

vec2 getOffset() {
    float slice = time*30;
    return vec2(floor(slice), 5.0 - floor(slice/8.));
}

void main() {
    vec2 texCoords = (vtexCoord + getOffset()) / vec2(8.0, 6.0);
    fragColor = texture(explosion, texCoords);
    fragColor *= fragColor.a;
}
