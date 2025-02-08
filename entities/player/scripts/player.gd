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

var state: Enums.PlayerStates = Enums.PlayerStates.NORMAL;

var screen_size: Vector2;

@onready var bullet_manager: Marker2D = $BulletManager;
@onready var reload_cooldown: Timer = $ReloadCooldown;
@onready var reload: Timer = $Reload;

func _ready() -> void:
	PlayerReference.set_player(self);
	look_at(Vector2.UP);
	screen_size = get_viewport_rect().size;
	current_ammo = max_ammo;

func _physics_process(delta) -> void:
	## Look at / rotation
	var mouse_position = get_global_mouse_position();
	look_at(mouse_position);
	
	## Direction and movement
	var new_direction = get_movement_input();
	velocity = Vector2(new_direction.x * speed, new_direction.y * speed);
	move_and_slide();
	
	## Dash TODO
	if Input.is_action_just_pressed("dash"):
		
		pass;
	
	## Screen limits
	position.x = clamp(position.x, 0 + 50, screen_size.x - 50);
	position.y = clamp(position.y, 0 + 50, screen_size.y - 50);
	
	## Shoot
	if Input.is_action_pressed("shoot") and time_since_last_shoot <= 0 and current_ammo > 0:
		shoot();
	
	if time_since_last_shoot > 0:
		time_since_last_shoot = clamp(time_since_last_shoot - delta, 0, fire_rate);

func shoot() -> void:
	bullet_manager.spawn_bullet(current_bullet, position, rotation);
	time_since_last_shoot = fire_rate;
	current_ammo -= 1;
	reload_cooldown.start();
	reload.stop();

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

func _hitted(attack: Attack) -> void:
	if state == Enums.PlayerStates.INVINCIBLE:
		return;

func _start_reloading() -> void:
	reload.start();

func _reload_ammo() -> void:
	current_ammo += 1;
	if current_ammo == max_ammo:
		reload.stop();
	ammo_changed.emit();


func _on_invincible_timeout() -> void:
	state = Enums.PlayerStates.NORMAL;
