shader_type canvas_item;

uniform vec4 vignette_color : source_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform float vignette_start : hint_range(0.0, 1.0) = 0.4;
uniform float vignette_end : hint_range(0.0, 1.0) = 0.4;

void fragment() {
	vec2 uv = UV - vec2(0.5);
	float d = length(uv);
	float vignette = smoothstep(vignette_start, vignette_end, d);
	
	// Apply vignette
	COLOR.rgb = vignette_color.rgb;
	COLOR.a = (1.0 - vignette) * vignette_color.a;
}
