class_name Player
extends CharacterBody2D

@export var max_health: int = 50;
@export var speed: int = 800;
@export var current_bullet: Enums.PlayerBullets;
@export var fire_rate: float = 0.08;
@export var max_ammo: int = 30;

var can_move: bool = false;
var can_shoot: bool = false;
var can_dash: bool = false;
var current_health: int = max_health;
var time_since_last_shoot: float = 0.0;
var current_ammo: int = max_ammo;
var state: Enums.PlayerStates = Enums.PlayerStates.NORMAL;

var screen_size: Vector2;

@onready var hitbox: Area2D = $Hitbox;
@onready var bullet_manager: Marker2D = $BulletManager;
@onready var audio: AudioStreamPlayer2D = $Audio;
@onready var reload_cooldown: Timer = $ReloadCooldown;
@onready var reload: Timer = $Reload;
@onready var invincible: Timer = $Invincible;

func _ready() -> void:
	PlayerReference.set_player(self);
	look_at(Vector2.UP);
	screen_size = get_viewport_rect().size;
	SignalBus.connect("level_started", Callable(self, "unfreeze"));

func _physics_process(delta) -> void:
	if can_move:
		## Look at / rotation
		var mouse_position = get_global_mouse_position();
		look_at(mouse_position);
		
		## Direction and movement
		var new_direction = get_movement_input();
		velocity = Vector2(new_direction.x * speed, new_direction.y * speed);
		move_and_slide();
		
		## Dash TODO
		if Input.is_action_just_pressed("dash") and new_direction != Vector2.ZERO:
			
			pass;
		
		## Screen limits
		position.x = clamp(position.x, 0 + 50, screen_size.x - 50);
		position.y = clamp(position.y, 0 + 50, screen_size.y - 50);
	
	if can_shoot:
		## Shoot
		if Input.is_action_pressed("shoot") and time_since_last_shoot <= 0 and current_ammo > 0:
			shoot();
		
		if time_since_last_shoot > 0:
			time_since_last_shoot = clamp(time_since_last_shoot - delta, 0, fire_rate);
	

func shoot() -> void:
	## Bullet spawn
	var bullet_instance = BulletFactory.create_player_bullet(current_bullet);
	bullet_instance.initialize(current_bullet);
	get_tree().current_scene.add_child(bullet_instance);
	bullet_instance.global_position = position;
	bullet_instance.rotation = rotation;
	
	## Ammo stuff
	time_since_last_shoot = fire_rate;
	current_ammo -= 1;
	reload_cooldown.start();
	reload.stop();
	
	audio.play_by_event(Enums.PlayerEvents.SHOOT);
	SignalBus.emit_player_shot();
	SignalBus.emit_update_player_ammo();

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

func hitted(attack: Attack) -> void:
	if state == Enums.PlayerStates.INVINCIBLE:
		return;
	
	audio.play_by_event(Enums.PlayerEvents.HITTED);
	SignalBus.emit_player_got_hit();
	damage(attack.damage);
	state = Enums.PlayerStates.INVINCIBLE;
	invincible.start();

func damage(amount: int) -> void:
	current_health += amount;
	SignalBus.emit_update_player_health();
	if current_health <= 0:
		current_health = 0;
		handle_death();

func heal(amount: int) -> void:
	current_health += amount;
	if current_health > max_health:
		current_health = max_health;

func handle_death() -> void:
	visible = false;
	freeze();
	hitbox.collision_layer = 6; ## layer death
	SignalBus.emit_player_death();
	audio.play_by_event(Enums.PlayerEvents.DIE);

func freeze() -> void:
	can_move = false;
	can_shoot = false;
	can_dash = false;

func unfreeze() -> void:
	can_move = true;
	can_shoot = true;
	can_dash = true;

func _start_reloading() -> void:
	reload.start();

func _reload_ammo() -> void:
	current_ammo += 1;
	if current_ammo == max_ammo:
		reload.stop();
	SignalBus.emit_update_player_ammo();


func _on_invincible_timeout() -> void:
	state = Enums.PlayerStates.NORMAL;
