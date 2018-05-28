#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec3 norm[];
out vec3 n;
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;

uniform float d = 1;

void generateFace(vec4 v1, vec4 v2, vec3 normal) {
	gfrontColor = vec4(cross(v2.xyz - v1.xyz, normal), 1);
	vec4 trans = vec4(d*n, 0);
	gl_Position = modelViewProjectionMatrix*v1;
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*(v1 + trans);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*v2;
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*(v2 + trans);
	EmitVertex();
	EndPrimitive();
}

void main( void ) {
	n = normalize(norm[0] + norm[1] + norm[2]);

	gfrontColor = vec4(n, 1);
	// for(int i = 0; i < 3; i++) {
	// 	gl_Position = modelViewProjectionMatrix*(gl_in[i].gl_Position);
	// 	EmitVertex();
	// }	
	// EndPrimitive();

	for(int i = 0; i < 3; i++) {
		gl_Position = modelViewProjectionMatrix*(gl_in[i].gl_Position + vec4(d*n, 0));
		EmitVertex();
	}
	EndPrimitive();

	generateFace(gl_in[0].gl_Position, gl_in[1].gl_Position, n);
	generateFace(gl_in[1].gl_Position, gl_in[2].gl_Position, n);
	generateFace(gl_in[2].gl_Position, gl_in[0].gl_Position, n);
}
