extends Node

var camera: Camera2D;

## Return central position Vector2
func get_global_position() -> Vector2:
	return camera.get_viewport_rect().size / 2;
