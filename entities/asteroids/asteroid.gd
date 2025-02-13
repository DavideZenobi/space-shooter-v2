extends Node2D

var body_damage: int = -20;
var direction: Vector2 = Vector2.DOWN;
var speed: int;
var rotational_speed: float;

@onready var hitbox: Area2D = $Hitbox;

func _ready() -> void:
	speed = randi_range(400, 800);
	rotational_speed = randf_range(60.0, 280.0);

func _physics_process(delta) -> void:
	position += direction * speed * delta;
	rotation_degrees += rotational_speed * delta;

func _on_hitbox_area_entered(area: Area2D) -> void:
	var attack = Attack.new();
	attack.damage = self.body_damage;
	attack.damage_type = Enums.DamageTypes.ASTEROID;
	area.get_parent().hitted(attack);
	
	queue_free();

func _on_screen_exited() -> void:
	queue_free();
