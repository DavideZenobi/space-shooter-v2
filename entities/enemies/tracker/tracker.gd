class_name Tracker
extends Enemy

@onready var shoot_cooldown: Timer = $ShootCooldown;

func _ready():
	state = Enums.EnemyStates.MOVING_TO_TARGET;

func _physics_process(delta) -> void:
	
	match behaviour:
		Enums.EnemyBehaviour.SOLO:
		
			match state:
				Enums.EnemyStates.IDLE:
					look_at(target_point);
				
				Enums.EnemyStates.MOVING_TO_TARGET:
					look_at(target_point);
					direction = (target_point - global_position).normalized();
					position += direction * speed * delta;
					if global_position.distance_to(target_point) < 10.0:
						change_state(Enums.EnemyStates.ATTACKING);
						shoot_cooldown.start();
				
				Enums.EnemyStates.ATTACKING:
					look_at(PlayerReference.get_player_position());
					## shoot TODO
					pass;
			
		Enums.EnemyBehaviour.PATROL:
			pass;
