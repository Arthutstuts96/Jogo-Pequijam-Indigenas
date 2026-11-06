if(place_meeting(x, y, obj_player) && !som_folhas) {
	audio_play_sound(som_andar_folhas, 2, false);
	som_folhas = true;
}

if(!place_meeting(x, y, obj_player) && som_folhas){
	som_folhas = false;	
}