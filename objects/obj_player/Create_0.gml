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
	estado_atual = ESTADOS.ANDANDO;
}

mudar_estado_morto = function () {
	sprite_index = sp_player_morto;
	vel_horizontal = 0;
	vel_vertical = 0;
	estado_atual = ESTADOS.MORTO;
}