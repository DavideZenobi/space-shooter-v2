class_name Player
extends CharacterBody2D

signal ammo_changed;

@export var max_health: int = 100;
@export var speed: int = 800;
@export var current_bullet: Enums.PlayerBullets;
@export var fire_rate: float = 0.08;
@export var max_ammo: int = 30;

var time_since_last_shoot: float = 0.0;
var current_ammo: int;

@onready var bullet_manager: Marker2D = $BulletManager;
@onready var reload_cooldown: Timer = $ReloadCooldown;
@onready var reload: Timer = $Reload;

func _physics_process(delta):
	var mouse_position = get_global_mouse_position();
	look_at(mouse_position);
	
	var new_direction = get_movement_input();
	velocity = Vector2(new_direction.x * speed, new_direction.y * speed);
	move_and_slide();
	
	#position.x = clamp(position.x, 0 + 50, screen_size.x - 50);
	#position.y = clamp(position.y, 0 + 50, screen_size.y - 50);

func shoot():
	bullet_manager.spawn_bullet(current_bullet, position, rotation);

func get_movement_input() -> Vector2:
	var direction = Vector2.ZERO;
	if Input.is_action_pressed("move_left"):
		direction.x -= 1;
	if Input.is_action_pressed("move_right"):
		direction.x += 1;
	if Input.is_action_pressed("move_up"):
		direction.y -= 1;
	if Input.is_action_pressed("move_down"):
		direction.y += 1;
	
	direction = direction.normalized();
	return direction;
