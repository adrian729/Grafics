#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D skeletons;

void main()
{
	vec4 color = texture(skeletons, vtexCoord);
    fragColor = vec4(1. - color.r, 1. - color.g, 1. - color.b, color.a);
}
