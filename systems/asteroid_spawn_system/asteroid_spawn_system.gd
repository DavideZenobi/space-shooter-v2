class_name AsteroidSpawnSystem;
extends Node

var min_asteroids: int = 2;
var max_asteroids: int = 5;
var asteroids_per_wave: int;
var current_asteroid: int;
var current_wave: int = 0;

@onready var path_follow: PathFollow2D = $Path2D/PathFollow2D;
@onready var spawn: Timer = $Spawn;
@onready var spawn_interval: Timer = $SpawnInterval;

func spawn_wave() -> void:
	asteroids_per_wave = randi_range(min_asteroids, max_asteroids);
	spawn_interval.start();

func spawn_asteroid() -> void:
	var asteroid_scene = ScenesManager.asteroid;
	var asteroid_instance = asteroid_scene.instantiate();
	get_tree().root.add_child(asteroid_instance);
	asteroid_instance.global_position = get_random_location();

func get_random_location() -> Vector2:
	path_follow.progress_ratio = randf();
	return path_follow.global_position;

func start() -> void:
	spawn.start();
	current_wave += 1;

func stop() -> void:
	spawn.stop();

func _on_spawn_timeout() -> void:
	spawn_wave();

func _on_spawn_interval_timeout() -> void:
	spawn_asteroid();
	current_asteroid += 1;
	if current_asteroid >= asteroids_per_wave:
		spawn_interval.stop();
		current_asteroid = 0;
