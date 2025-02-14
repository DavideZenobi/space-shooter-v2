extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer;
@onready var game_over_menu: Control = $GameOverMenu;
@onready var main_menu_button: Button = $GameOverMenu/MarginContainer/VBoxContainer/HBoxContainer/MainMenuButton;
@onready var restart_button: Button = $GameOverMenu/MarginContainer/VBoxContainer/HBoxContainer/RestartButton;

func _ready() -> void:
	SignalBus.connect("player_death", Callable(self, "_on_player_death"));
	game_over_menu.visible = false;


func _on_animation_finished(anim_name: StringName) -> void:
	get_tree().paused = true;
	game_over_menu.visible = true;

func _on_player_death() -> void:
	animation_player.play("game_over_in");


func _on_button_pressed():
	print("Clicked!!");


func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false;
	ScenesManager.change_scene(Enums.Levels.HOME_MENU);


func _on_restart_button_pressed() -> void:
	get_tree().paused = false;
	ScenesManager.change_scene(Enums.Levels.LEVEL);
