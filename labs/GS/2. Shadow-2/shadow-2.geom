#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform vec3 boundingBoxMin, boundingBoxMax;

void main( void ) {

	for( int i = 0 ; i < 3 ; i++ ) {
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix*gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();

	for( int i = 0 ; i < 3 ; i++ ) {
		gfrontColor = vec4(0, 0, 0, 1);
		gl_Position = gl_in[i].gl_Position;
		gl_Position.y = boundingBoxMin.y;
		gl_Position = modelViewProjectionMatrix*gl_Position;
		EmitVertex();
	}
	EndPrimitive();

	if(gl_PrimitiveIDIn == 0) {
		gfrontColor = vec4(0, 1, 1, 1);
		float r = distance(boundingBoxMin, boundingBoxMax);
		vec3 c = (boundingBoxMin + boundingBoxMax)/2.;
		vec4 center = vec4(c.x, boundingBoxMin.y - 0.01, c.z, 1);
		gl_Position = center;
		gl_Position.x -= r/2.;
		gl_Position.z -= r/2.;
		gl_Position = modelViewProjectionMatrix*gl_Position;
		EmitVertex();
		gl_Position = center;
		gl_Position.x += r/2.;
		gl_Position.z -= r/2.;
		gl_Position = modelViewProjectionMatrix*gl_Position;
		EmitVertex();
		gl_Position = center;
		gl_Position.x -= r/2.;
		gl_Position.z += r/2.;
		gl_Position = modelViewProjectionMatrix*gl_Position;
		EmitVertex();
		gl_Position = center;
		gl_Position.x += r/2.;
		gl_Position.z += r/2.;
		gl_Position = modelViewProjectionMatrix*gl_Position;
		EmitVertex();
	}
}
