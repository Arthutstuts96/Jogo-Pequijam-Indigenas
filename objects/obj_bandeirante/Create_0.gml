// ===== MOVIMENTAÇÃO
x_original = x;
y_original = y;
path_start(caminho_bandeirante, velocidade_direcao, path_action_reverse, false);
seguir_player = false;
velocidade = 5;
vel_x = 0;
vel_y = 0;

// ===== CONE DE VISÃO
dist_max = 400
angulo_max = 15
dir_olhar = 270;
no_raio = false;

comecar_a_seguir_player = function() {
	path_end();
	audio_play_sound(som_bandeirante_encontrou, 9, false);
	seguir_player = true;
}

morto = false;
player_morto = false;