#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D colorMap;

uniform float time;

void main()
{
    mat2 rotacio = mat2(vec2(cos(time), -sin(time)), vec2(sin(time), cos(time)));

    vec2 C = vec2(0.272, 0.09);
    float r = 0.065;

    float d = sqrt(pow(vtexCoord.s - C.x,2.0) + pow(vtexCoord.t - C.y,2.0));
        
    if(d <= r) {
        vec2 rotatedVtexCoord = (rotacio * (vtexCoord - C)) + C; // translacio -> rotacio -> translacio (inversa)
        fragColor = frontColor * texture(colorMap, vec2(rotatedVtexCoord.s, rotatedVtexCoord.t));
    }
    else fragColor = frontColor * texture(colorMap, vec2(vtexCoord.s, vtexCoord.t));
}
