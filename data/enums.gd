class_name Enums

# Por ahora no lo voy a usar.
enum Entities {
	PLAYER,
	ENEMY,
	BULLETS,
}

## ---------------------##
## Level enums related
## ---------------------##

enum Levels {
	STARTER,
	HOME_MENU,
	GAME_OVER_MENU,
	LEVEL, ## Experimental
	LEVEL_1,
	LEVEL_2,
	LEVEL_3,
	LEVEL_4,
}

## Experimental, not being used
enum LevelPhases {
	INTRO,
	ONGOING,
	TRANSITION,
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
	#LIGHTWEIGHT,
	TRACKER,
	TANK,
	BOMBARDIER,
}

enum EnemyBullets {
	BASIC,
	BOMB,
	MINI_BOMB,
	
}

enum EnemyBehaviour {
	SOLO,
	PATROL,
}

enum EnemyStates {
	IDLE,
	MOVING_TO_TARGET,
	TRACKING,
	CHASING,
	ATTACKING,
	EXPLODING,
	PATROLLING,
}

# No se usa por ahora
enum EnemyDifficulties {
	EASY,
	MEDIUM,
	HARD,
}

enum BulletStates {
	FREE,
	HITTED,
}

enum DamageTypes {
	BULLET,
	BODY,
	ASTEROID,
}

enum EnemyDeathEffects {
	EXPLOSION1,
}

enum ItemEffects {
	HEALING,
	WEAPONG,
	GAME_STATUS,
}
