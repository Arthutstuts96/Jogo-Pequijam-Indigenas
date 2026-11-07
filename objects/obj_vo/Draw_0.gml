draw_self();

if(distance_to_object(obj_player) < distancia_ativar) {
	draw_sprite(sp_mouse_direito, 0, x - sprite_width / 3, y - sprite_height);	
}