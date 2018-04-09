#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

void main( void )
{	
	if(gl_PrimitiveIDIn != 0) {
		for( int i = 0 ; i < 3 ; i++ )
		{
			vec4 gposition_gen = gl_in[i].gl_Position / gl_in[i].gl_Position.w;
			gfrontColor = vfrontColor[i];
			gl_Position = gposition_gen;
			gl_Position.x -= 0.5;
			gl_Position.y += 0.5;
			EmitVertex();

		}
	    	EndPrimitive();
		for( int i = 0 ; i < 3 ; i++ )
		{
			vec4 gposition_gen = gl_in[i].gl_Position / gl_in[i].gl_Position.w;
			gfrontColor = vfrontColor[i];
			gl_Position = gposition_gen;
			gl_Position.x += 0.5;
			gl_Position.y += 0.5;
			EmitVertex();

		}
	    	EndPrimitive();
		for( int i = 0 ; i < 3 ; i++ )
		{
			vec4 gposition_gen = gl_in[i].gl_Position / gl_in[i].gl_Position.w;
			gfrontColor = vfrontColor[i];
			gl_Position = gposition_gen;
			gl_Position.x -= 0.5;
			gl_Position.y -= 0.5;
			EmitVertex();

		}
	    	EndPrimitive();
		for( int i = 0 ; i < 3 ; i++ )
		{
			vec4 gposition_gen = gl_in[i].gl_Position / gl_in[i].gl_Position.w;
			gfrontColor = vfrontColor[i];
			gl_Position = gposition_gen;
			gl_Position.x += 0.5;
			gl_Position.y -= 0.5;
			EmitVertex();

		}
	    	EndPrimitive();
	}
	else {
		for( int i = 0 ; i < 3 ; i++ )
		{
			vec4 gposition_gen = gl_in[i].gl_Position;
			gposition_gen.z = 0.999;
			gposition_gen = gposition_gen / gl_in[i].gl_Position.w;
			gfrontColor = vec4(0.,1.,0.,1.);
			gl_Position = gposition_gen;
			gl_Position.x -= 0.5;
			gl_Position.y += 0.5;
			EmitVertex();

		}
	    	EndPrimitive();

		/*
		Yellow - no cal
		*/

		for( int i = 0 ; i < 3 ; i++ )
		{
			vec4 gposition_gen = gl_in[i].gl_Position;
			gposition_gen.z = 0.999;
			gposition_gen = gposition_gen / gl_in[i].gl_Position.w;
			gfrontColor = vec4(1.,0.,0.,1.);
			gl_Position = gposition_gen;
			gl_Position.x -= 0.5;
			gl_Position.y -= 0.5;
			EmitVertex();

		}
	    	EndPrimitive();
		for( int i = 0 ; i < 3 ; i++ )
		{
			vec4 gposition_gen = gl_in[i].gl_Position;
			gposition_gen.z = 0.999;
			gposition_gen = gposition_gen / gl_in[i].gl_Position.w;
			gfrontColor = vec4(0.,0.,1.,1.);
			gl_Position = gposition_gen;
			gl_Position.x += 0.5;
			gl_Position.y -= 0.5;
			EmitVertex();

		}
	    	EndPrimitive();
	}

}






