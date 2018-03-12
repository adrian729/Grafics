#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D explosion;

uniform float time;

void main() {
    float slice = time*30;
    vec2 offset = vec2(floor(slice), 5.0 - floor(slice/8.0));
    vec2 texCoords = (vtexCoord + offset)/vec2(8.0, 6.0);
    fragColor = texture(explosion, texCoords);
    fragColor *= fragColor.a;
}
