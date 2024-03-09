shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform vec2 direction;

void fragment() {
	float red_offset = texture(SCREEN_TEXTURE, SCREEN_UV + 0.03  * direction).r;
	float green_offset = texture(SCREEN_TEXTURE, SCREEN_UV + 0.025 * direction).g;
	vec2 blue_offset = texture(SCREEN_TEXTURE, SCREEN_UV + -0.018 * direction).ba;
	
	COLOR = vec4(red_offset, green_offset, blue_offset);
}
