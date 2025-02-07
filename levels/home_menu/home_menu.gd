extends Control

func _ready():
	Logger.print_log("Home menu ready");

func _on_play_pressed():
	ScenesManager.change_scene(Enums.Levels.LEVEL);


func _on_options_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit();
