depth = -y;

if(distance_to_object(obj_player) < distancia_ativar && mouse_check_button_pressed(mb_right)) {
    if (!instance_exists(obj_caixa_texto)) {
        var _caixa = instance_create_layer(0, 0, "Instances", obj_caixa_texto);
        
		_caixa.textos = textos;
    }
}