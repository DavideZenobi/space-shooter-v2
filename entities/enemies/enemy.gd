class_name Enemy;
extends Node2D

var type: Enums.Enemies;
var behaviour: Enums.EnemyBehaviour;
var state: Enums.EnemyStates;
var target_point: Vector2;
var direction: Vector2;
var speed: int;
var times_hitted: int;

func initialize(new_behaviour: Enums.EnemyBehaviour) -> void:
	behaviour = new_behaviour;
	state = Enums.EnemyStates.IDLE;
	speed = 1000;
	times_hitted = 0;

func set_target_point(new_target_point: Vector2) -> void:
	target_point = new_target_point;

func change_state(new_state: Enums.EnemyStates) -> void:
	state = new_state;

func hitted():
	## TODO
	pass;
