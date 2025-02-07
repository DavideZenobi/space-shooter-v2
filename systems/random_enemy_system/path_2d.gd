extends Path2D

@onready var path_follow: PathFollow2D = $PathFollow2D;

func get_random_location() -> Vector2:
	path_follow.progress_ratio = randf();
	return path_follow.position;

func set_new_curve(new_curve: Curve2D) -> void:
	curve = new_curve;
