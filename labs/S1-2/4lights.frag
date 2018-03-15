#version 330 core

in vec3 P, N;
out vec4 fragColor;

uniform mat4 modelViewMatrixInverse;

uniform float time;
uniform bool rotate = true;

vec4 phong(vec3 V, vec3 N, vec3 P, vec3 lightPos, vec3 lightColor) {
	const float shininess = 100.0;
	const float Kd = 0.5;
	vec3 L = normalize(lightPos - P);
	vec3 R = reflect(-L, N);
	float NdotL = max(0.0, dot(N, L));
	float RdotV = max(0.0, dot(R, V));
	float spec =  pow(RdotV, shininess);
	return vec4(Kd*lightColor*NdotL + vec3(spec), 0);
}

vec3 eyeToObject(vec3 pos, int point) {
    return (modelViewMatrixInverse*vec4(pos, point)).xyz;
}

void main() {
    vec3 V = normalize((modelViewMatrixInverse*vec4(0,0,0,1)).xyz - P);

    vec3 pgreen = vec3(0, 10, 0);
    vec3 pyellow = vec3(0, -10, 0);
    vec3 pblue = vec3(10, 0, 0);
    vec3 pred = vec3(-10, 0, 0);
    float angle = 0;
    if(rotate){
        float c = cos(time);
        float s = sin(time);
        mat3 rmatrix = mat3(
            vec3(c, s, 0),
            vec3(-s, c, 0),
            vec3(0, 0, 1)
        );
        pgreen = rmatrix*pgreen;
        pyellow = rmatrix*pyellow;
        pblue = rmatrix*pblue;
        pred = rmatrix*pred;
    }
    pgreen = eyeToObject(pgreen, 1);
    pyellow = eyeToObject(pyellow, 1);
    pblue = eyeToObject(pblue, 1);
    pred = eyeToObject(pred, 1);

    vec3 nN = normalize(N);
    
    fragColor = phong(V, nN, P, pgreen, vec3(0, 1, 0))
    + phong(V, nN, P, pyellow, vec3(1, 1, 0))
    + phong(V, nN, P, pblue, vec3(0, 0, 1))
    + phong(V, nN, P, pred, vec3(1, 0, 0));
}
