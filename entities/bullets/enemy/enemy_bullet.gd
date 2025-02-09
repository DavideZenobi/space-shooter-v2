class_name EnemyBullet
extends Node2D

@export var damage: int = -10;
@export var speed: int = 3000;

var type: Enums.EnemyBullets;
## this state is for sprite and fade out animation
## now, bullet disappear instantly
var state: Enums.BulletStates;
var has_collided: bool = false;

func initialize(new_type: Enums.EnemyBullets, new_damage: int = -10, new_speed: int = 3000) -> void:
	type = new_type;
	damage = new_damage;
	speed = new_speed;
	state = Enums.BulletStates.FREE;

func _physics_process(delta: float) -> void:
	match state:
		Enums.BulletStates.FREE:
			position += Vector2.RIGHT.rotated(rotation) * speed * delta;
		Enums.BulletStates.HITTED:
			pass;

func _on_hitbox_area_entered(area: Area2D) -> void:
	state = Enums.BulletStates.HITTED;
	if has_collided:
		return;
	
	var attack = Attack.new();
	attack.damage = self.damage;
	attack.damage_type = Enums.DamageTypes.BULLET;
	area.get_parent().hitted(attack);
	
	has_collided = true;
	queue_free();
	return;

func _on_screen_exited() -> void:
	queue_free();
