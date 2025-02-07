extends Control

signal intro_countdown_finished;

@export var countdown_seconds: int = 3;

@onready var label: Label = $Label;
@onready var one_second_tic: Timer = $OneSecondTic;

func _ready():
	hide();
	label.text = str(countdown_seconds);


func start():
	show();
	one_second_tic.start();

func finish():
	hide();
	intro_countdown_finished.emit();

func _on_one_second_tic_timeout():
	countdown_seconds -= 1;
	label.text = str(countdown_seconds);
	if countdown_seconds == 0:
		label.text = "START";
	elif countdown_seconds < 0:
		one_second_tic.stop();
		finish();
