// ===== MOVIMENTAÇÃO
path_start(caminho_bandeirante, velocidade_direcao, path_action_reverse, false);
seguir_player = false;
velocidade = 5;
vel_x = 0;
vel_y = 0;

// ===== CONE DE VISÃO
dist_max = 400
angulo_max = 15
dir_olhar = 270;

comecar_a_seguir_player = function() {
	path_end();
	seguir_player = true;
}

morto = false;