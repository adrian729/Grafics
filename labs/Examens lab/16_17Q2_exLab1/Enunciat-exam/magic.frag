#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
in vec3 N;
out vec4 fragColor;

uniform sampler2D window;
uniform sampler2D interior1; // observo un 1 al final
uniform sampler2D exterior2; // observo un 2 al final

uniform float time;

void main()
{

    vec4 C = texture(window, vec2(vtexCoord.s, vtexCoord.t));

    if(C.a < 1.0) {
        vec4 D = texture(interior1, (vtexCoord + 0.5 * N.xy));
        if(D.a == 1.0) {
            fragColor = D * D.a;            
        }
        else {
            vec4 E = texture(exterior2, (vtexCoord + 0.7 * N.xy));
            fragColor = E * E.a;
        }
    }
    else {
        fragColor = C * C.a;
    }   

}
