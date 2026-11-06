enum ESTADOS {
	IDLE,
	ANDANDO,
	TRANSFORMANDO,
	DASH,
	MORTO,
}

estado_atual = ESTADOS.IDLE

// ===== MOVIMENTAÇÃO
velocidade = 8;
vel_horizontal = 0;
vel_vertical = 0;

velocidade_dash = 20;

// ===== TEMPORIZADORES
timer_dash = 0;
total_tempo_dash = 16;
cooldown_dash_total = 60;
cooldown_dash_atual = 0;

cooldown_ataque = 120;
cooldown_ataque_atual = 0;

// ===== ATAQUE E FOCO INIMIGOS

// ===== MUDAR ESTADOS
mudar_estado_dash = function (dir_x = 0, dir_y = 1) {
	sprite_index = sp_player_dash;
	audio_play_sound(som_dash, 4, false);
	_direcao_dash = point_direction(0, 0, dir_x, dir_y);
	timer_dash = total_tempo_dash;
	cooldown_dash_atual = cooldown_dash_total;
	estado_atual = ESTADOS.DASH;
}	

mudar_estado_parado = function () {
	sprite_index = sp_player_idle;
	vel_horizontal = 0;
	vel_vertical = 0;	
	estado_atual = ESTADOS.IDLE;
}	

mudar_estado_andando = function () {
	sprite_index = sp_player_andando;
	audio_play_sound(som_andar, 5, true);
	estado_atual = ESTADOS.ANDANDO;
}

mudar_estado_morto = function () {
	sprite_index = sp_player_morto;
	audio_play_sound(som_player_morrendo, 9, false);
	vel_horizontal = 0;
	vel_vertical = 0;
	estado_atual = ESTADOS.MORTO;
}


// ===== TROCAR SPRITES
trocar_sprites = function (_esquerda, _direita, _cima, _baixo) {
    if (estado_atual == ESTADOS.IDLE) {
        
        // Verifica as diagonais (Nordeste, Noroeste, Sudeste, Sudoeste)
        if (_cima && _direita) {
            sprite_index = sp_player_idle_ne;
        }
        else if (_cima && _esquerda) {
            sprite_index = sp_player_idle_no;
        }
        else if (_baixo && _direita) {
            sprite_index = sp_player_idle_se;
        }
        else if (_baixo && _esquerda) {
            sprite_index = sp_player_idle_so;
        }
        // Verifica as direções cardeais puras (Cima, Baixo, Lados)
        else if (_cima) {
            sprite_index = sp_player_idle_costas; // ou sp_player_idle_n
        }
        else if (_baixo) {
            sprite_index = sp_player_idle_frente; // ou sp_player_idle_s
        }
		/*
        else if (_esquerda || _direita) {
            // Se estiver indo para os lados, usa o sprite lateral 
            // e inverte a escala do sprite com image_xscale caso necessário
            sprite_index = sp_player_idle_lateral;
            if (_esquerda) image_xscale = -1;
            if (_direita)  image_xscale = 1;
        }
		*/
    }
}