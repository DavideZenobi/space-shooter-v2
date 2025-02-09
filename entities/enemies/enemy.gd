class_name Enemy;
extends Node2D

signal enemy_died;

@export var max_health: int;
@export var body_damage: int;
@export var speed: int;

var current_health: int;
var type: Enums.Enemies;
var current_bullet: Enums.EnemyBullets;
var behaviour: Enums.EnemyBehaviour; ## SOLO OR PATROL
var state: Enums.EnemyStates;
var target_point: Vector2;
var direction: Vector2;
var times_hitted: int;

@onready var sprite: Sprite2D = $Sprite2D;
@onready var life_bar: TextureProgressBar = $LifeBar;
@onready var hitbox: Area2D = $Hitbox;

func _ready() -> void:
	hitbox.connect("body_entered", Callable(self, "_on_hitbox_body_entered"));
	current_health = max_health;
	speed = 1000;
	times_hitted = 0;
	life_bar.value = 100;

func initialize(new_behaviour: Enums.EnemyBehaviour) -> void:
	behaviour = new_behaviour;

func set_target_point(new_target_point: Vector2) -> void:
	target_point = new_target_point;

func change_state(new_state: Enums.EnemyStates) -> void:
	state = new_state;

func hitted(attack: Attack) -> void:
	update_health(attack.damage);
	update_life_bar();

func update_health(amount: int) -> void:
	current_health += amount;
	if current_health <= 0:
		queue_free();

func _on_hitbox_body_entered(body: Player) -> void:
	var attack = Attack.new();
	attack.damage = body_damage;
	attack.damage_type = Enums.DamageTypes.BODY;
	body.hitted(attack);

func update_life_bar():
	life_bar.value = current_health * 100 / max_health;
	if life_bar.value <= 30:
		life_bar.texture_progress = load("res://entities/enemies/ui_sprites/red_bar.png");
