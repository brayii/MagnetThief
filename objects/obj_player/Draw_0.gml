draw_self();

if(keyboard_check(vk_space))
{
	draw_set_alpha(0.2);
	draw_circle(x, y, magnet_range, false);
	draw_set_alpha(1)
}