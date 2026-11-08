var _texto_completo = textos[pagina_atual];

if (index < string_length(_texto_completo)) {
    index += vel_texto;
    texto_exibido = string_copy(_texto_completo, 1, floor(index));
} else {
	audio_stop_sound(som_texto);
}


if (keyboard_check_pressed(vk_enter)) {
    if (index >= string_length(_texto_completo)) {
		audio_play_sound(som_texto, 4, true);
        pagina_atual++;
        
        if (pagina_atual >= array_length(textos)) {
			audio_stop_sound(som_texto);
            instance_destroy();
        } else {
            index = 0;
            texto_exibido = "";
        }
    } else {
        index = string_length(_texto_completo);
        texto_exibido = _texto_completo;
    }
}