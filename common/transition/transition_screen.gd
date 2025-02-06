extends CanvasLayer

signal fade_out_finished;
signal fade_in_finished;

@onready var color_rect: ColorRect = $ColorRect;
@onready var animation_player: AnimationPlayer = $AnimationPlayer;

func _ready() -> void:
	color_rect.visible = false;

func _on_animation_finished(animation_name: StringName) -> void:
	if animation_name == "fade_in":
		color_rect.visible = false;
		emit_signal("fade_in_finished");
	elif animation_name == "fade_out":
		emit_signal("fade_out_finished");
		animation_player.play("fade_in");

func start_transition() -> void:
	color_rect.visible = true;
	animation_player.play("fade_out");
