extends Node

var player_sounds: Dictionary;

func _ready():
	Logger.print_log("Audio manager ready");

func get_player_sound(event: Enums.PlayerEvents) -> AudioStream:
	return player_sounds[event];

func preload_audios():
	for player_event in AudioDatabase.player_sounds.keys():
		player_sounds[player_event] = load(AudioDatabase.player_sounds[player_event]);
