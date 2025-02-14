class_name PlayerHUD
extends Control

@export var player: Player;

@onready var life_bar: TextureProgressBar = $LifeBar;
@onready var life_text: Label = $LifeBar/LifeText;
@onready var ammo_bar: TextureProgressBar = $AmmoBar;
@onready var ammo_text: Label = $AmmoBar/AmmoText;

func _ready() -> void:
	SignalBus.connect("update_player_health", Callable(self, "update_life"));
	SignalBus.connect("update_player_ammo", Callable(self, "update_ammo"));
	life_text.text = str(player.current_health) + " / " + str(player.max_health);
	ammo_text.text = str(player.current_ammo) + " / " + str(player.max_ammo);


func update_life():
	## Bar stuff
	life_bar.value = player.current_health * 100 / player.max_health;
	## Text stuff
	life_text.text = str(player.current_health) + " / " + str(player.max_health);

func update_ammo():
	## Bar stuff
	ammo_bar.value = player.current_ammo * 100 / player.max_ammo;
	## Text stuff
	ammo_text.text = str(player.current_ammo) + " / " + str(player.max_ammo)
