extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer;
@onready var game_over_menu: Control = $GameOverMenu;
@onready var button: Button = $GameOverMenu/MarginContainer/VBoxContainer/Button;

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
