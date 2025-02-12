extends Node

var player_shots_fired: int = 0;
var player_shots_fired_success: int = 0;
var enemies_killcount: int = 0;

var accuracy: float;

func _ready() -> void:
	pass;

func _on_player_shot_fired() -> void:
	player_shots_fired += 1;
	print(player_shots_fired);

func _on_player_shot_fired_success() -> void:
	player_shots_fired_success += 1;

func _on_enemy_died() -> void:
	enemies_killcount += 1;
