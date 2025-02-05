extends Node

@onready var load_bar: TextureProgressBar = $LoadBar;

var resource = ResourceLoader.load("res://entities/player/player.tscn");

func _ready():
	print(resource.resource_name);
	Logger.print_log("Main scene started");
	
	ScenesManager.preload_scenes();

func update_load_bar():
	
	pass;
