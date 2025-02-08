class_name Enemy;
extends Node2D

signal enemy_died;

@export var max_health: int;

var current_health: int;
var type: Enums.Enemies;
var behaviour: Enums.EnemyBehaviour; ## SOLO OR PATROL
var state: Enums.EnemyStates;
var target_point: Vector2;
var direction: Vector2;
var speed: int;
var times_hitted: int;

@onready var sprite: Sprite2D = $Sprite2D;
@onready var health_component: Health = $Health;

func initialize(new_behaviour: Enums.EnemyBehaviour) -> void:
	behaviour = new_behaviour;
	current_health = max_health;
	state = Enums.EnemyStates.IDLE;
	speed = 1000;
	times_hitted = 0;

func set_target_point(new_target_point: Vector2) -> void:
	target_point = new_target_point;

func change_state(new_state: Enums.EnemyStates) -> void:
	state = new_state;

func hitted(attack: Attack):
	## TODO
	pass;
