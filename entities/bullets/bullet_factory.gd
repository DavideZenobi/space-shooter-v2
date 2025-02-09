class_name BulletFactory
extends Node


static func create_player_bullet(bullet_type: Enums.PlayerBullets) -> PlayerBullet:
	var bullet_scene = ScenesManager.get_player_bullet_scene(bullet_type);
	var bullet_instance = bullet_scene.instantiate();
	return bullet_instance;

static func create_enemy_bullet(bullet_type: Enums.EnemyBullets) -> EnemyBullet:
	var bullet_scene = ScenesManager.get_enemy_bullet(bullet_type);
	var bullet_instance = bullet_scene.instantiate();
	return bullet_instance;
