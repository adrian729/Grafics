#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D colorMap;
uniform float time;

void main() {    
    float t = vtexCoord.t;
    if(fract(time) <= 0.5) {
        if(t > 0.5) t = -t;
    }
    else if(t < 0.5) t = -t;
    fragColor = texture(colorMap, vec2(vtexCoord.s, t));
}
