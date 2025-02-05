extends Node

var scenes_to_load: Array = [
	"res://entities/player/player.tscn",
	"res://entities/enemies/test1.tscn",
	"res://entities/enemies/test.tscn",
];
var total_scenes: int = scenes_to_load.size();
var loaded_scenes: int = 0;

func _ready():
	Logger.print_log("Scenes manager ready");
	

func preload_scenes():
	for scene in scenes_to_load:
		pass;

## Changes between scenes (home menu, level 1, level 2, death menu)
func change_scene():
	
	pass;
