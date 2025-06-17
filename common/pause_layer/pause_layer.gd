extends Node

var level_paused = false

func _input(event: InputEvent) -> void:
	if GlobalVariables.is_game_over:
		return
	
	if event.is_action_pressed("ui_pause"):
		get_tree().paused = not get_tree().paused
		
		if level_paused:
			GlobalVariables.restore_previous_game_speed()
			SignalBus.emit_level_unpaused()
		elif !level_paused:
			GlobalVariables.set_game_speed(0.0)
			SignalBus.emit_level_paused()
			
		level_paused = !level_paused
		self.visible = level_paused
