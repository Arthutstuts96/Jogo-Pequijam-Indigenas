/*
 Recomendações para o Step da máquina de estados:
	1. Ler Teclas e Entradas (Inputs)
	2. Decrementar Cooldowns Globais
	3. Verificações de Troca de Estado (Triggers/Botões)
	4. Switch (estado_atual) -> Lógica e Animação do Estado Atual
	5. Aplicação Física Final (move_and_collide)
	
	https://www.youtube.com/watch?v=KOI1j_BmJJE&t=1s
	https://www.youtube.com/watch?v=zO20mhMc-8g&t=6s
*/
// ===== TECLAS E DIREÇÕES
var _esquerda = keyboard_check(ord("A"));
var _direita = keyboard_check(ord("D"));
var _cima = keyboard_check(ord("W"));
var _baixo = keyboard_check(ord("S"));
var _dash = keyboard_check_pressed(vk_space);
var _atacar = keyboard_check_pressed(ord("R"));

var _andando = _esquerda || _direita || _cima || _baixo;

var _dir_horizontal = _direita - _esquerda;
var _dir_vertical = _baixo - _cima;

var _escondida = place_meeting(x, y, obj_grama);

// trocar_sprites(_esquerda, _direita, _cima, _baixo);

// ===== MÁQUINA DE ESTADOS
switch(estado_atual) {
	case ESTADOS.IDLE:
		if(_andando) {
			mudar_estado_andando();
		}
		if(_dash && cooldown_dash_atual <= 0 && !_escondida) {
			mudar_estado_dash();
		}
		
		break;
	case ESTADOS.ANDANDO:
		if (_dir_horizontal != 0) {
			image_xscale = _dir_horizontal;	
		}
		if(_dir_horizontal != 0 || _dir_vertical != 0) {
			var _direcao = point_direction(0, 0, _dir_horizontal, _dir_vertical);
			
			vel_horizontal = lengthdir_x(velocidade, _direcao);
			vel_vertical = lengthdir_y(velocidade, _direcao);
		} else {
			audio_stop_sound(som_andar);
			mudar_estado_parado();
		}
		if(_dash && cooldown_dash_atual <= 0 && !_escondida) {
			audio_stop_sound(som_andar);
			mudar_estado_dash(_dir_horizontal, _dir_vertical);
		}
		
		break;
	case ESTADOS.DASH:	
		if (_dir_horizontal != 0) {
			image_xscale = _dir_horizontal;	
		}
		
		vel_horizontal = lengthdir_x(velocidade_dash, _direcao_dash);
		vel_vertical = lengthdir_y(velocidade_dash, _direcao_dash);
		
		timer_dash--;
		
		if(timer_dash <= 0) {
			mudar_estado_parado();
		}

		break;
	case ESTADOS.TRANSFORMANDO:
	
		break;
	case ESTADOS.MORTO:		
		_atacar = 0;
		
		if(image_index >= image_number - 1) {
			instance_destroy();	
			instance_create_layer(2206, 1272, "Instances", obj_player);
			
			with(obj_bandeirante) {
				x = x_original;
				y = y_original;
				path_start(caminho_bandeirante, velocidade_direcao, path_action_reverse, false);
				seguir_player = false;
				player_morto = false;
			}
		}
		break;
	default:
		break;
}

// ===== EXECUTADOS A CADA FRAME INDEPENDENTE DE ESTADO
move_and_collide(vel_horizontal, vel_vertical, obj_colisao);

velocidade = 8 - (4 * _escondida);

if(cooldown_dash_atual > 0) {
	cooldown_dash_atual--;	
}

if(cooldown_ataque_atual > 0) {
	cooldown_ataque_atual--;	
}

// ===== ATACAR UM INIMIGO
var _inimigo_mais_proximo = TargetingHelper.get_nearest(x, y, 300, obj_bandeirante);

if (_inimigo_mais_proximo != noone && _inimigo_mais_proximo.morto != true) {
	if(cooldown_ataque_atual <= 0) {
	    _inimigo_mais_proximo.image_blend = c_red;
    
	    if (_atacar) {
			audio_play_sound(som_apunhalada, 9, false);	
			cooldown_ataque_atual = cooldown_ataque;
		    var _direcao = point_direction(_inimigo_mais_proximo.x, _inimigo_mais_proximo.y, x, y);
		    x = _inimigo_mais_proximo.x + lengthdir_x(60, _direcao);
		    y = _inimigo_mais_proximo.y + lengthdir_y(60, _direcao);
        
		    vel_horizontal = 0;
		    vel_vertical = 0; 
		
			with (_inimigo_mais_proximo) {
				image_blend = c_white;
		        sprite_index = sp_bandeirante_morto;
		        image_index = 0;        
		        path_end();
				morto = true;			
		    }
		}
	}
} else {
	if(instance_exists(obj_bandeirante)) {
		obj_bandeirante.image_blend = c_white;	
	}
}
