#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 norm[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;

uniform float disp = 0.05;

void main( void ) {
	vec4 baricenter = (gl_in[0].gl_Position + gl_in[1].gl_Position + gl_in[2].gl_Position) / 3.;
	vec4 normal = vec4(normalize(norm[0] + norm[1] + norm[2]), 0);
	vec4 center = modelViewProjectionMatrix*(baricenter + normal*disp);

	gl_Position = modelViewProjectionMatrix*gl_in[0].gl_Position;
	gfrontColor = vfrontColor[0];
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*gl_in[1].gl_Position;
	gfrontColor = vfrontColor[1];
	EmitVertex();
	gl_Position = center;
	gfrontColor = vec4(1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*gl_in[2].gl_Position;
	gfrontColor = vfrontColor[2];
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*gl_in[0].gl_Position;
	gfrontColor = vfrontColor[0];
	EmitVertex();

	gfrontColor = vfrontColor[0];
    EndPrimitive();
}
