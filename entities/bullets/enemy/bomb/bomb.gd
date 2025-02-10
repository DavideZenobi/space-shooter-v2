class_name Bomb
extends EnemyBullet

var initial_frequency: float = 0.5;
var final_frequency: float = 3.0;

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D;
@onready var explode: Timer = $Explode;

func _physics_process(delta: float) -> void:
	var direction = (PlayerReference.get_player_position() - global_position).normalized();
	position += direction * speed * delta;
	
	var current_frequency = lerp(initial_frequency, final_frequency, (explode.wait_time - explode.time_left) / explode.wait_time);
	
	var alpha_value = (sin(2.0 * PI * current_frequency * (explode.wait_time - explode.time_left)) + 1.0) / 2.0;
	modulate.a = alpha_value;

func spawn_mini_bombs():
	var directions = [Vector2(1, 1), Vector2(1, -1), Vector2(-1, 1), Vector2(-1, -1)];
	
	for direction in directions:
		var mini_bomb_instance = BulletFactory.create_enemy_bullet(Enums.EnemyBullets.MINI_BOMB);
		mini_bomb_instance.set_direction(direction);
		get_tree().root.add_child(mini_bomb_instance);
		mini_bomb_instance.global_position = position;

func _on_explode_timeout():
	spawn_mini_bombs();
	queue_free();
