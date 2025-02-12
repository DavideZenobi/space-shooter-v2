class_name EnemyBullet
extends Node2D

@export var damage: int;
@export var speed: int;

var type: Enums.EnemyBullets;
var has_collided: bool = false;

func _on_hitbox_area_entered(area: Area2D) -> void:
	if has_collided:
		return;
	
	var attack = Attack.new();
	attack.damage = self.damage;
	attack.damage_type = Enums.DamageTypes.BULLET;
	area.get_parent().hitted(attack);
	
	has_collided = true;
	queue_free();

func _on_screen_exited() -> void:
	queue_free();
