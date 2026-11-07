draw_set_color(c_black);
draw_set_alpha(0.4);

var _largura_sombra = 24;
var _altura_sombra  = 8;

draw_ellipse(x - _largura_sombra, y - _altura_sombra, x + _largura_sombra, y + _altura_sombra, false);

draw_set_alpha(1.0);
draw_set_color(c_white);

draw_self();

if(distance_to_object(obj_player) < distancia_ativar) {
	draw_sprite(sp_mouse_direito, 0, x - sprite_width / 3, y - sprite_height - 48);	
}
