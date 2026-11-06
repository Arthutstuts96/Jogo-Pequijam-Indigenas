if(!morto) {
	// ===== MOVIMENTAÇÃO E SEGUIR JOGADOR
	if(distance_to_object(obj_player) < 40 && !seguir_player) {
		comecar_a_seguir_player();
	}

	if(seguir_player) {
		direcao = point_direction(x, y, obj_player.x, obj_player.y);
		vel_x = lengthdir_x(velocidade, direcao);
		vel_y = lengthdir_y(velocidade, direcao);
	
		move_and_collide(vel_x, vel_y, obj_bandeirante);
	}

	// ===== CONE DE VISÃO
	if(!seguir_player && point_distance(x, y, obj_player.x, obj_player.y) < dist_max) {
		var _angulo_2 = point_direction(x, y, obj_player.x, obj_player.y);
	
		if(abs(angle_difference(dir_olhar, _angulo_2)) < angulo_max) {
			if (!place_meeting(obj_player.x, obj_player.y, obj_grama)) {
	            comecar_a_seguir_player();
	        }
		}
	}
	
	// ===== MATAR O PLAYER
	if(place_meeting(x, y, obj_player) && !player_morto) {
		player_morto = true;
		obj_player.mudar_estado_morto();
	}
} else {
	// ===== MORRA!
	if(image_index >= image_number - 1) {
		instance_destroy();	
	}
}
//(!collision_line(x, y, obj_player.x, obj_player.y, obj_grama, false, false))