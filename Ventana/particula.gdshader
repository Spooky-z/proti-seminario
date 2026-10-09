shader_type canvas_item;

uniform sampler2D emission_texture;
uniform vec4 emission_color : source_color = vec4(1.0);

void fragment() {
	vec4 tex = texture(TEXTURE, UV);
	vec4 emission = texture(emission_texture, UV);

	COLOR = tex;
	COLOR.rgb += emission.rgb * emission_color.rgb;
}
