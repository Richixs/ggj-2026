extends Node2D
class_name Entity

@export var entity_name: String = "Entity"
@export var max_health: int = 100
var health: int

func _ready():
	health = max_health

func take_damage(amount: int) -> void:
	health -= amount
	if health <= 0:
		die()

func die() -> void:
	queue_free()
