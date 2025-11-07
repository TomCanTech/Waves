shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

uniform float size: hint_range(0.0, 1.0) = 0.0;
uniform float time_scale = 2.0;
uniform float freq = 2.0;

void fragment() {
	vec2 uv = vec2(UV.x * (PI * 2.0), (2.0 * (UV.y - 0.5)));
	float offset = 1.0 - size;
	float sine_val = sin(freq*(uv.x + time_scale * TIME)) * size - offset;
	float sine_val2 = sin(freq*(uv.x + time_scale * TIME)) * size + offset;
	if (!((uv.y > sine_val) && (uv.y < sine_val2))) {
		COLOR.a = 0.0;
	}
}
