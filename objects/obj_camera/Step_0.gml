if(keyboard_check(ord("E"))) {
	if(!piar_coruja) {
		audio_play_sound(som_coruja, 5, false);
		piar_coruja = true;
	}
	x = lerp(x, mouse_x, 0.04);
	y = lerp(y, mouse_y, 0.04);
} else {
	piar_coruja = false;
	x = lerp(x, obj_player.x, 0.08);
	y = lerp(y, obj_player.y, 0.08);	
}
