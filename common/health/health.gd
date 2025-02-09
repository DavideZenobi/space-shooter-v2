class_name Health
extends Node

signal enemy_health_changed;
signal enemy_died;

var max_health: int;
var current_health: int;

func initialize(new_max_health: int):
	max_health = new_max_health;
	current_health = max_health;

func update_health(amount: int):
	current_health += amount;
