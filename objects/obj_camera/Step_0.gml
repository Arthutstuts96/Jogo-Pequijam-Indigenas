if(keyboard_check(ord("E"))) {
	x = lerp(x, mouse_x, 0.05);
	y = lerp(y, mouse_y, 0.05);
} else {
	x = lerp(x, obj_player.x, 0.1);
	y = lerp(y, obj_player.y, 0.1);	
}