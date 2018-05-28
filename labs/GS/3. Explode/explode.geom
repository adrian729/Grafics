#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 norm[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform float time;

uniform float speed = 1.2;

void main( void ) {
	vec4 n = vec4(speed*time*normalize(norm[0] + norm[1] + norm[2]), 0);
	for( int i = 0 ; i < 3 ; i++ ) {
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix*(gl_in[i].gl_Position + n);
		EmitVertex();
	}
}