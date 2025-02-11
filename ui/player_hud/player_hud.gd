class_name PlayerHUD
extends Control

@onready var life_bar: TextureProgressBar = $LifeBar;
@onready var ammo_bar: TextureProgressBar = $AmmoBar;

func _ready() -> void:
	SignalBus.connect("player_hitted", Callable(self, "update_life_bar"));
	SignalBus.connect("update_player_ammo", Callable(self, "update_ammo_bar"));


func update_life_bar():
	
	pass;

func update_ammo_bar():
	
	pass;
