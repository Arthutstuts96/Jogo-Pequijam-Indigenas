var _larg_tela = display_get_gui_width();
var _alt_tela = display_get_gui_height();

var _margem = 20;
var _alt_caixa = 80;

var _x1 = _margem;
var _y1 = _alt_tela - _alt_caixa - _margem;
var _x2 = _larg_tela - _margem;
var _y2 = _alt_tela - _margem;

draw_set_font(fn_dialogo);
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(_x1, _y1, _x2, _y2, false);

draw_set_color(c_white);
draw_set_alpha(1.0);
draw_rectangle(_x1, _y1, _x2, _y2, true);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text_ext(_x1 + 10, _y1 + 10, texto_exibido, 20, (_x2 - _x1) - 20);
draw_sprite(sp_enter, 0, _x2 - _margem, _y2 - _margem);

draw_set_font(fn_padrao);