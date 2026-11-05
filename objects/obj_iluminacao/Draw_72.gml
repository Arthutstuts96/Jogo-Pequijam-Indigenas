var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);

// Garante que a superfície existe
if (!surface_exists(lightsurface)) {
    lightsurface = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
}

// 1. Abre a superfície para desenho
surface_set_target(lightsurface);

// 2. Limpa a tela com a cor da escuridão (Ajuste o Alpha para controlar o quão escuro o jogo fica)
// c_black com Alpha 0.85 cria uma noite/penumbra bacana onde ainda dá para enxergar o fundo
draw_clear_alpha(c_black, 0.85);

// 3. Define o modo SUBTRACT para cortar a transparência da escuridão
gpu_set_blendmode(bm_subtract);

// 4. Desenha a luz de todas as tochas na sala
with (obj_tocha) {
    // Desenha o gradiente de luz subtraindo o Alpha da escuridão
    draw_sprite_ext(sp_luz, 0, x - _vx, y - _vy, image_xscale, image_yscale, 0, c_white, 1);
}

// 5. Restaura o modo normal e fecha a superfície
gpu_set_blendmode(bm_normal);
surface_reset_target();