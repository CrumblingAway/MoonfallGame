shader_type canvas_item;

void fragment()
{
	vec4 current_color = texture(TEXTURE, UV);
	COLOR = vec4(1.0 - current_color.r, 1.0 - current_color.y, 1.0 - current_color.z, current_color.a);
}
