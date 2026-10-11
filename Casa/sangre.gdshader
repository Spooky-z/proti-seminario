shader_type canvas_item;

uniform sampler2D gradient_texture;

void fragment() {
	vec4 base_color = texture(TEXTURE, UV);
	vec4 gradient_color = texture(gradient_texture, UV);
	COLOR = base_color * gradient_color;
}
