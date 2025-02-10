extends EnemyBullet

func _physics_process(delta: float) -> void:
	position += Vector2.RIGHT.rotated(rotation) * speed * delta;
