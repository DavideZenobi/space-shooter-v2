extends Marker2D

func spawn_bullet(bullet_type: Enums.PlayerBullets, player_position: Vector2, player_rotation: float) -> void:
	var bullet_scene = ScenesManager.get_player_bullet_scene(bullet_type);
	var bullet_instance = bullet_scene.instantiate();
	get_tree().root.add_child(bullet_instance);
	bullet_instance.global_position = player_position;
	bullet_instance.rotation = player_rotation;
