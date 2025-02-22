class_name DataRecord
extends Node

var data: DataTemplate = DataTemplate.new();

func _ready() -> void:
	SignalBus.connect("player_shot", Callable(self, ("add_player_shots_fired")));
	SignalBus.connect("player_hitted", Callable(self, ("add_player_shots_hitted")));
	SignalBus.connect("enemy_killed", Callable(self, ("add_enemies_killed")));

func add_player_shots_fired() -> void:
	data.player_shots_fired += 1;

func add_player_shots_hitted() -> void:
	data.player_shots_hitted += 1;

## Argument not used but needed
func add_enemies_killed(_position: Vector2) -> void:
	data.enemies_killed += 1;

func get_data() -> DataTemplate:
	return data;
