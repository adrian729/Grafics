#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 norm[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform float time;

uniform float speed = 1.2;
uniform float angSpeed = 8.0;

void main( void ) {
	vec4 n = vec4(speed*time*normalize(norm[0] + norm[1] + norm[2]), 0);
	float angle = angSpeed*time;
	float s = sin(angle);
	float c = cos(angle);
	mat3 rot = mat3(
		vec3(c, s, 0),
		vec3(-s, c, 0),
		vec3(0, 0, 1)
	);
	vec3 baricenter = (gl_in[0].gl_Position + gl_in[1].gl_Position  + gl_in[2].gl_Position).xyz/3.;
	for( int i = 0 ; i < 3 ; i++ ) {
		gfrontColor = vfrontColor[i];
		gl_Position = gl_in[i].gl_Position;
		gl_Position.xyz = rot*(gl_Position.xyz - baricenter) + baricenter;
		gl_Position = modelViewProjectionMatrix*(gl_Position + n);
		EmitVertex();
	}
}
