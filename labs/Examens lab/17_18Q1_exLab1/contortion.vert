#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 2) in vec3 color;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform float time;

void main() {
    frontColor = vec4(color,1.0);
    vec3 vtx = vertex;
    if(vtx.y > 0.5) {
        float A = (vtx.y - 0.5)*sin(time);
        float s = sin(A);
        float c = cos(A);
        mat3 rot = mat3(
            vec3(1, 0, 0),
            vec3(0, c, s),
            vec3(0, -s, c)
        );
        vtx.y -= 1;
        vtx = rot*vtx;
        vtx.y += 1;
    }
    gl_Position = modelViewProjectionMatrix*vec4(vtx, 1.0);
}
