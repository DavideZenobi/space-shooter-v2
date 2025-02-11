extends Node

var state: Enums.LevelPhases;

@onready var level_intro_countdown_ui: Control = $LevelIntroCountdownUi;
@onready var random_enemy_system: RandomEnemySystem = $RandomEnemySystem;

func _ready():
	Logger.print_log("Level 1 started");
	TransitionScreen.connect("fade_in_finished", Callable(self, "_on_fade_in_finished"));
	level_intro_countdown_ui.connect("intro_countdown_finished", Callable(self, "_on_intro_countdown_finished"));
	state = Enums.LevelPhases.INTRO;

func start():
	random_enemy_system.initialize();


func change_state(new_state: Enums.LevelPhases):
	state = new_state;

## Intro countdown finished
func _on_intro_countdown_finished():
	change_state(Enums.LevelPhases.ONGOING);
	start();

## Fade in from transition screen, starter point
func _on_fade_in_finished():
	Logger.print_log("Fade in finished");
	pre_start();

func _on_player_death():
	ScenesManager.change_scene(Enums.Levels.GAME_OVER_MENU);

func pre_start():
	level_intro_countdown_ui.start();
