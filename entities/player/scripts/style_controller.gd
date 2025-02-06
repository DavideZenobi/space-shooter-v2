extends Sprite2D

@onready var blink_interval: Timer = $BlinkInterval;
@onready var blink_duration: Timer = $BlinkDuration;

func _on_taken_damage():
	print("hey")
	blink_duration.start();
	blink_interval.start();
	modulate = Color.INDIAN_RED;

func _on_healing_taken():
	
	pass;

func _stop_blink_effect():
	blink_duration.stop();
	blink_interval.stop();
	modulate = Color(1, 1, 1, 1);

func _alternate_blink_effect():
	
	if modulate.a == 1:
		modulate.a = 0.2;
	else:
		modulate.a = 1;
