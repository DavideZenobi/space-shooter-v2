class_name WaveSystem
extends Node

signal waves_finished;

var total_waves: int;
var current_wave: int;

@onready var new_wave: Timer = $NewWave;

func start():
	
	pass;

func _on_new_wave_timeout():
	## TODO
	current_wave += 1;
	if current_wave > total_waves:
		new_wave.stop();
