#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D colorMap;

uniform float time;

void main()
{
    if(fract(time) <= 0.5) {
        if(vtexCoord.t > 0.5) {
            fragColor = frontColor * texture(colorMap, vec2(vtexCoord.s, -vtexCoord.t));
        }
        else fragColor = frontColor * texture(colorMap, vtexCoord);
    }
    else {
        if(vtexCoord.t < 0.5) {
            fragColor = frontColor * texture(colorMap, vec2(vtexCoord.s, -vtexCoord.t));
        }
        else fragColor = frontColor * texture(colorMap, vtexCoord);
    }

}
