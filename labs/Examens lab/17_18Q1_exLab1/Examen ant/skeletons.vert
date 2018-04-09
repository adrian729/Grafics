#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 3) in vec2 texCoord;

out vec2 vtexCoord;
uniform int tiles = 1;
uniform float time;

uniform vec3 boundingBoxMin; // Cantonada minima capsa englobant
uniform vec3 boundingBoxMax; // Cantonada maxima capsa englobant

void main()
{    
	float frameSize = 1. / 44.;
    float offsetS = int(30*time)*frameSize;
    vtexCoord = vec2(texCoord.s/44.*tiles + offsetS, texCoord.t*tiles);
    gl_Position = vec4(vertex, 1.0);
}



