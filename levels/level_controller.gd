extends Node

@onready var level_intro_countdown_ui: Control = $LevelIntroCountdownUi;
@onready var random_enemy_system: RandomEnemySystem = $RandomEnemySystem;

func _ready():
	Logger.print_log("Level 1 started");
	TransitionScreen.connect("fade_in_finished", Callable(self, "_on_fade_in_finished"));
	level_intro_countdown_ui.connect("intro_countdown_finished", Callable(self, "start"));

func start():
	random_enemy_system.initialize();


## Fade in from transition screen, starter point
func _on_fade_in_finished():
	Logger.print_log("Fade in finished");
	pre_start();

func pre_start():
	level_intro_countdown_ui.start();
