extends AudioStreamPlayer2D

func play_by_event(event: Enums.PlayerEvents) -> void:
	var sound = AudioManager.get_player_sound(event);
	stream = sound;
	set_pitch_scale(apply_random_pitch());
	play();

func apply_random_pitch() -> float:
	return randf_range(1.5, 2.5);
