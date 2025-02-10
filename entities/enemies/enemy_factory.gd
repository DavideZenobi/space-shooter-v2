class_name EnemyFactory
extends Node

static func create_random_enemy() -> Enemy:
	var enemy_type = Enums.Enemies.values()[randi_range(0, Enums.Enemies.size() - 1)];
	var enemy_scene = ScenesManager.get_enemy_scene(enemy_type);
	var enemy_instance = enemy_scene.instantiate();
	return enemy_instance

static func create_enemy(enemy_type: Enums.Enemies) -> Enemy:
	var enemy_scene = ScenesManager.get_enemy_scene(enemy_type);
	var enemy_instance = enemy_scene.instantiate();
	return enemy_instance;
