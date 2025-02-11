extends Node

signal player_shot;
signal player_hitted;
signal update_player_health(health: int);
signal update_player_ammo(ammo: int);

func emit_player_shot():
	player_shot.emit();

func emit_player_hitted():
	player_hitted.emit();

func emit_update_player_health():
	update_player_health.emit();

func emit_update_player_ammo():
	update_player_ammo.emit();
