extends Node

signal scene_loading_finished;

## Packed Scenes
var levels_scenes: Dictionary;
var player_scene: PackedScene;
var player_bullets_scenes: Dictionary;
var enemies_scenes: Dictionary;
var enemies_bullets_scenes: Dictionary;
var enemy_death_effect: PackedScene;
var asteroid: PackedScene;

var previous_scene: Enums.Levels;
var current_scene: Enums.Levels;

func _ready() -> void:
	Logger.print_log("Scenes manager ready");
	previous_scene = Enums.Levels.STARTER;
	

## GETTERS
func get_player_bullet_scene(player_bullet_type: Enums.PlayerBullets) -> PackedScene:
	return player_bullets_scenes[player_bullet_type];

func get_enemy_scene(enemy_type: Enums.Enemies) -> PackedScene:
	return enemies_scenes[enemy_type];

func get_enemy_bullet(enemy_bullet: Enums.EnemyBullets) -> PackedScene:
	return enemies_bullets_scenes[enemy_bullet];

func preload_scenes() -> void:
	Logger.print_log("Loading scenes...");
	
	## Levels scenes load
	for level in ScenesDatabase.levels.keys():
		levels_scenes[level] = load(ScenesDatabase.levels[level]);
	
	## Player scene load
	player_scene = load(ScenesDatabase.player);
	
	## Player bullets scenes load
	for player_bullet in ScenesDatabase.player_bullets.keys():
		player_bullets_scenes[player_bullet] = load(ScenesDatabase.player_bullets[player_bullet]);
	
	## Enemies scenes load
	for enemy in ScenesDatabase.enemies.keys():
		enemies_scenes[enemy] = load(ScenesDatabase.enemies[enemy])
	
	## Enemy bullets scenes load
	for enemy_bullet in ScenesDatabase.enemy_bullets.keys():
		enemies_bullets_scenes[enemy_bullet] = load(ScenesDatabase.enemy_bullets[enemy_bullet]);
	
	## Enemy death effect
	enemy_death_effect = load(ScenesDatabase.enemy_death_effect);
	
	## Asteroid
	asteroid = load(ScenesDatabase.asteroid);
	
	scene_loading_finished.emit();



## Changes between scenes (home menu, level 1, level 2, death menu)
func change_scene(new_scene: Enums.Levels) -> void:
	TransitionScreen.start_transition();
	await TransitionScreen.fade_out_finished;
	get_tree().change_scene_to_packed(levels_scenes[new_scene]);
	previous_scene = current_scene;
	current_scene = new_scene;
