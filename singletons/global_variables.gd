extends Node

var game_speed: float = 1.0;
var previous_game_speed = 0.0;
var is_game_freezed: bool = false;
var is_game_over: bool = false;

func _ready() -> void:
	previous_game_speed = game_speed;

func set_game_speed(new_game_speed: float):
	previous_game_speed = game_speed;
	game_speed = new_game_speed;
	
func restore_previous_game_speed():
	game_speed = previous_game_speed;
	previous_game_speed = 0.0;
