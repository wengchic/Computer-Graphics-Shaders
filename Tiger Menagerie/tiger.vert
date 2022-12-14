#version 330 compatibility

uniform sampler3D Noise3;
uniform float Timer;


out vec2 vST;

void main ( ) {

    float Time = Timer > 0.5 ? 1. - Timer : Timer;

    vST = gl_MultiTexCoord0.st;

    vec3 vMCposition  = gl_Vertex.xyz;

    vec3 vSurfaceNormal = normalize(gl_NormalMatrix * gl_Vertex.xyz);

    vec4 nv = texture3D(Noise3, vMCposition);
    float n = (nv.r + nv.g + nv.b + nv.a) - 1.5;

    vec4 glVertex = vec4(gl_Vertex.xyz + (vSurfaceNormal * Time * sin(Time + n * 100)* 3), 1.);

    gl_Position = gl_ModelViewProjectionMatrix * glVertex;
}