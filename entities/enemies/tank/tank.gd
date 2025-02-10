class_name Tank
extends Enemy

@export var chasing_speed: int;

func _ready() -> void:
	super._ready();
	state = Enums.EnemyStates.MOVING_TO_TARGET;

func _physics_process(delta: float) -> void:
	match state:
		Enums.EnemyStates.MOVING_TO_TARGET:
			look_at(target_point);
			direction = (target_point - global_position).normalized();
			position += direction * speed * delta;
			if global_position.distance_to(target_point) < 10.0:
				change_state(Enums.EnemyStates.CHASING);
		Enums.EnemyStates.CHASING:
			var player_position = PlayerReference.get_player_position();
			look_at(player_position);
			direction = (player_position - global_position).normalized();
			if global_position.distance_to(player_position) > 20.0:
				position += direction * chasing_speed * delta;

func on_die() -> void:
	
	super.on_die();
