#version 330 core

layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;

uniform float step = 0.12;

void face(vec4 v1, vec4 v2, vec4 v3, vec4 v4, vec3 n) {
	//vec3 n = cross(v2.xyz - v1.xyz, v3.xyz - v1.xyz);
	gfrontColor = vec4(n, 1);
	gl_Position = modelViewProjectionMatrix*v1;
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*v2;
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*v3;
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*v4;
	EmitVertex();
	EndPrimitive();
}

void main( void ) {
	vec4 center = (gl_in[0].gl_Position + gl_in[1].gl_Position + gl_in[2].gl_Position)/3.;
	center /= step;
	center = vec4(step*vec3(int(center.x), int(center.y), int(center.z)), center.w);
	// top
	face(center + vec4(-step, step, step, 0), center + vec4(step, step, step, 0), 
		center + vec4(-step, step, -step, 0), center + vec4(step, step, -step, 0),
		vec3(0, 1, 0));
	// bottom
	face(center + vec4(step, -step, step, 0), center + vec4(-step, -step, step, 0),
		center + vec4(step, -step, -step, 0), center + vec4(-step, -step, -step, 0),
		vec3(0, -1, 0));
	// front
	face(center + vec4(-step, -step, step, 0), center + vec4(step, -step, step, 0),
		center + vec4(-step, step, step, 0), center + vec4(step, step, step, 0),
		vec3(0, 0, 1));
	// back
	face(center + vec4(step, -step, -step, 0), center + vec4(-step, -step, -step, 0),
		center + vec4(step, step, -step, 0), center + vec4(-step, step, -step, 0),
		vec3(0, 0, -1));
	// right
	face(center + vec4(step, -step, step, 0), center + vec4(step, -step, -step, 0),
		center + vec4(step, step, step, 0), center + vec4(step, step, -step, 0),
		vec3(1, 0, 0));
	// left
	face(center + vec4(-step, -step, -step, 0), center + vec4(-step, -step, step, 0),
		center + vec4(-step, step, -step, 0), center + vec4(-step, step, step, 0),
		vec3(-1, 0, 0));
}
