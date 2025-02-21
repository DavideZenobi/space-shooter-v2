class_name Item
extends Node2D

@export var speed: int = 300;

var direction: Vector2;

@onready var hitbox: Area2D = $Hitbox;

func _ready() -> void:
	direction = (global_position - CameraReference.get_global_position()).normalized();

func _physics_process(delta):
	position += direction * speed * delta;

func _on_hitbox_entered(area: Area2D):
	apply_effect();
	queue_free();

func apply_effect() -> void:
	## Implement on child
	pass;

func _on_screen_exited() -> void:
	queue_free();
