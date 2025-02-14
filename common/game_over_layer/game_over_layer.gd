extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer;
@onready var game_over_menu: Control = $GameOverMenu;
@onready var main_menu_button: Button = $GameOverMenu/MarginContainer/VBoxContainer/HBoxContainer/MainMenuButton;
@onready var restart_button: Button = $GameOverMenu/MarginContainer/VBoxContainer/HBoxContainer/RestartButton;
@onready var shots_fired: Label = $GameOverMenu/MarginContainer/VBoxContainer/ShotsFired;
@onready var shots_hitted: Label = $GameOverMenu/MarginContainer/VBoxContainer/ShotsHitted;
@onready var accuracy: Label = $GameOverMenu/MarginContainer/VBoxContainer/Accuracy;
@onready var enemies_killed: Label = $GameOverMenu/MarginContainer/VBoxContainer/EnemiesKilled;
@onready var time: Label = $GameOverMenu/MarginContainer/VBoxContainer/Time;

func _ready() -> void:
	SignalBus.connect("player_death", Callable(self, "_on_player_death"));
	game_over_menu.visible = false;

## Starter point
func _on_player_death() -> void:
	animation_player.play("game_over_in");

func _on_animation_finished(anim_name: StringName) -> void:
	get_tree().paused = true;
	game_over_menu.visible = true;

func set_data(data: DataTemplate) -> void:
	shots_fired.text = "Shots fired: " + str(data.player_shots_fired);
	shots_hitted.text = "Shots hitted: " + str(data.player_shots_hitted);
	if data.player_shots_fired == 0:
		accuracy.text = "Accuracy: " + str(0);
	else:
		accuracy.text = "Accuracy: " + str(data.player_shots_hitted * 100 / data.player_shots_fired) + "%";
	enemies_killed.text = "Enemies killed: " + str(data.enemies_killed);

func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false;
	ScenesManager.change_scene(Enums.Levels.HOME_MENU);


func _on_restart_button_pressed() -> void:
	get_tree().paused = false;
	ScenesManager.change_scene(Enums.Levels.LEVEL);
