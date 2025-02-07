class_name EnemyFactory
extends Node

static func create_enemy(enemy_type: Enums.Enemies) -> Enemy:
	var enemy_scene = ScenesManager.get_enemy_scene(enemy_type);
	var enemy_instance = enemy_scene.instantiate();
	return enemy_instance;
