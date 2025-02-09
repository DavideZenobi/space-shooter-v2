class_name RandomEnemySystem
extends Node

var enemy_number_per_spawn: int = 1;

@onready var spawn: Timer = $Spawn;
@onready var path: Path2D = $Path2D;

func initialize():
	spawn.start();

func stop():
	spawn.stop();

func set_data():
	
	pass;

func spawn_enemy():
	var spawn_position: Vector2 = path.get_random_location();
	var enemy_type: Enums.Enemies = Enums.Enemies.TRACKER;
	var enemy_instance: Enemy = EnemyFactory.create_enemy(enemy_type);
	var target_point: Vector2 = Vector2(randi_range(0 + 50, 1920 - 50), randi_range(0 + 50, 1080 - 50));
	enemy_instance.set_target_point(target_point);
	get_tree().root.add_child(enemy_instance);
	enemy_instance.initialize(Enums.EnemyBehaviour.SOLO);
	enemy_instance.add_to_group("enemies");
	enemy_instance.global_position = spawn_position;

func _on_spawn_timeout():
	spawn_enemy();
