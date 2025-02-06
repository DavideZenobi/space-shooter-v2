extends Node

func _ready():
	Logger.print_log("Starter scene started");
	
	ScenesManager.connect("scene_loading_finished", Callable(self, "_on_scene_loading_finished"));
	ScenesManager.preload_scenes();

func _on_scene_loading_finished():
	Logger.print_log("All scenes loaded!");
	ScenesManager.change_scene(Enums.Levels.HOME_MENU);
