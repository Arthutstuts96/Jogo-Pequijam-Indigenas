draw_self();

// ===== FUNÇÂO GERADA PARA VER O CONE
if (!seguir_player && !morto) {
    var _ang_esq = dir_olhar - angulo_max;
    var _ang_dir = dir_olhar + angulo_max;

    var _x_esq = x + lengthdir_x(dist_max, _ang_esq);
    var _y_esq = y + lengthdir_y(dist_max, _ang_esq);

    var _x_dir = x + lengthdir_x(dist_max, _ang_dir);
    var _y_dir = y + lengthdir_y(dist_max, _ang_dir);
    
    draw_set_alpha(0.3);
    draw_set_color(c_yellow);

    draw_primitive_begin(pr_trianglestrip);
        draw_vertex(x, y);
        draw_vertex(_x_esq, _y_esq);
        draw_vertex(_x_dir, _y_dir);
    draw_primitive_end();
    
    draw_set_alpha(0.8);
    draw_line(x, y, _x_esq, _y_esq);
    draw_line(x, y, _x_dir, _y_dir);

    draw_set_alpha(1);
    draw_set_color(c_white);
}