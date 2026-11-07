var _larg_tela = display_get_gui_width();
var _alt_tela = display_get_gui_height();

var _cor_noite = make_color_rgb(10, 15, 35);

draw_set_alpha(0.75);
draw_set_color(_cor_noite);

draw_rectangle(0, 0, _larg_tela, _alt_tela, false);

draw_set_alpha(1.0);
draw_set_color(c_white);