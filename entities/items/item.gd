class_name Item
extends Node2D

@onready var hitbox: Area2D = $Hitbox;

func _on_hitbox_entered(area: Area2D):
	apply_effect();
	queue_free();

func apply_effect() -> void:
	## Implement on child
	pass;
