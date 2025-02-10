class_name MiniBomb
extends EnemyBullet

var direction: Vector2;

func set_direction(new_direction: Vector2):
	direction = new_direction.normalized();

func _physics_process(delta):
	position += direction * speed * delta;
	
