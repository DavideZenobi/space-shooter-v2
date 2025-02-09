class_name ScenesDatabase

static var levels: Dictionary = {
	Enums.Levels.HOME_MENU: "res://levels/home_menu/home_menu.tscn",
	Enums.Levels.LEVEL: "res://levels/level.tscn",
}

static var player: String = "res://entities/player/player.tscn";

static var player_bullets: Dictionary = {
	Enums.PlayerBullets.BASIC: "res://entities/bullets/player/basic/basic.tscn",
}

static var enemies: Dictionary = {
	Enums.Enemies.TRACKER: "res://entities/enemies/tracker/tracker.tscn",
	Enums.Enemies.LIGHTWEIGHT: "res://entities/enemies/lightweight/lightweight.tscn",
	Enums.Enemies.TANK: "res://entities/enemies/tank/tank.tscn",
	Enums.Enemies.BOMBARDIER: "res://entities/enemies/bombardier/bombardier.tscn",
}

static var enemy_bullets: Dictionary = {
	Enums.EnemyBullets.BASIC: "res://entities/bullets/enemy/basic/basic.tscn",
}
