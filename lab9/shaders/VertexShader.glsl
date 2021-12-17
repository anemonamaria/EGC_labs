#version 330

// Input
layout(location = 0) in vec3 v_position;
layout(location = 1) in vec3 v_normal;
layout(location = 2) in vec2 v_texture_coord;
layout(location = 3) in vec3 v_color;

// Uniform properties
uniform mat4 Model;
uniform mat4 View;
uniform mat4 Projection;

uniform bool quad;
// Output
out vec2 texcoord;


void main()
{
    // TODO(student): Pass v_texture_coord as output to fragment shader
    texcoord = v_texture_coord;

	mat4 MV = View * Model;
	if (quad) {
		MV[0][0] = 1.f;
		MV[0][1] = 0.f;
		MV[0][2] = 0.f;

		MV[1][0] = 0.f;
		MV[1][1] = 1.f;
		MV[1][2] = 0.f;

		MV[2][0] = 0.f;
		MV[2][1] = 0.f;
		MV[2][2] = 1.f;
	}
    gl_Position = Projection * View * Model * vec4(v_position, 1.0);
}
