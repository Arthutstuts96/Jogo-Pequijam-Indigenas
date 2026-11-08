if (exibir_comandos) {
    var _larg_tela = display_get_gui_width();
    var _alt_tela = display_get_gui_height();
    var _meio_x = _larg_tela / 2;
    var _meio_y = _alt_tela / 2;
    
    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _larg_tela, _alt_tela, false);
    
    draw_set_alpha(1.0); 
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle); 
    
    for(var i = 0; i < array_length(comandos); i++) {
        draw_text_transformed(_meio_x, _meio_y + (i * 52), comandos[i], 1.5, 1.5, 0);
    }
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}