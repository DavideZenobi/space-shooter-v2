class_name DropSystem
extends Node

@export var drop_chance: int = 10;

func _ready() -> void:
	SignalBus.connect("enemy_killed", Callable(self, "_on_enemy_killed"));

func _on_enemy_killed(enemy_position: Vector2) -> void:
	if randi_range(1, 100) < drop_chance:
		spawn_item(enemy_position)

func spawn_item(spawn_position: Vector2) -> void:
	pass;
