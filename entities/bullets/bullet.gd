class_name Bullet
extends Node2D

@export var damage: int = 10;
@export var speed: int = 3000;

var has_collided: bool = false;

func initialize(new_damage: int, new_speed: int) -> void:
	damage = new_damage;
	speed = new_speed;

func _physics_process(delta: float) -> void:
	position += Vector2.RIGHT.rotated(rotation) * speed * delta;

func _on_area_entered(area: Area2D) -> void:
	if has_collided:
		return;
	
	var attack = Attack.new();
	attack.damage = self.damage;
	area.get_parent().hitted(attack);
	
	has_collided = true;
	queue_free();

func _on_screen_exited() -> void:
	queue_free();
