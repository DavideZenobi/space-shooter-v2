class_name Enums

# Por ahora no lo voy a usar.
enum Entities {
	PLAYER,
	ENEMY,
	NPC
}

## ---------------------##
## Level enums related
## ---------------------##

enum Levels {
	LEVEL_1,
	LEVEL_2,
	LEVEL_3,
	LEVEL_4,
}

enum LevelPhases {
	COUNTDOWN,
	ONGOING,
	WAVE,
	BOSS,
}

## ---------------------##
## Player enums related
## ---------------------##

enum PlayerStates {
	NORMAL,
	INVINCIBLE,
}
# Hay que cambiar el nombre de este enum.
# Este enum debería servir para casos como cuando aparezca una pequeña
# animación, el jugador no debería poder moverse por ejemplo.
enum PlayerCondition {
	# Can move?
}

enum PlayerBullets {
	BASIC,
}

enum PlayerEvents {
	SHOOT,
	HITTED,
	HEALING_TAKEN,
	POWER_UP_TAKEN,
	DIE,
}

## ---------------------##
## Enemies enums related
## ---------------------##

enum Enemies {
	LIGHTWEIGHT,
	TRACKER,
	TANK,
	BOMBARDIER,
}

enum EnemyBehaviour {
	SOLO,
	PATROL,
}

enum EnemyStates {
	IDLE,
	MOVING_TO_TARGET,
	TRACKING,
	ATTACKING,
	PATROLLING,
}

# No se usa por ahora
enum EnemyDifficulties {
	EASY,
	MEDIUM,
	HARD,
}
