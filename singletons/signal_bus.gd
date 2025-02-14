extends Node

signal player_shot;
signal player_got_hit;
signal player_hitted;
signal player_death;
signal update_player_health(health: int);
signal update_player_ammo(ammo: int);
signal level_started;
signal enemy_killed;

func emit_player_shot():
	player_shot.emit();

func emit_player_got_hit():
	player_got_hit.emit();

func emit_player_hitted():
	player_hitted.emit();

func emit_player_death():
	player_death.emit();

func emit_update_player_health():
	update_player_health.emit();

func emit_update_player_ammo():
	update_player_ammo.emit();

func emit_level_started():
	level_started.emit();

func emit_enemy_killed():
	enemy_killed.emit();
