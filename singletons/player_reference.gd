extends Node

var player: Player;

func set_player(new_player: Player) -> void:
	player = new_player;

func get_player_position() -> Vector2:
	return player.global_position;
