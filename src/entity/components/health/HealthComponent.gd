extends Node
class_name HealthComponent

@export var data: HealthData

signal health_changed(current: int, max: int)
signal died

func _ready() -> void:
	if data == null:
		push_error("HealthData not assigned")
		return

	emit_signal("health_changed", data.current_health, data.max_health)

func take_damage(amount: int) -> void:
	data.current_health -= amount
	data.current_health = max(data.current_health, 0)

	emit_signal("health_changed", data.current_health, data.max_health)

	if data.current_health <= 0:
		die()

func heal(amount: int) -> void:
	data.current_health = min(data.current_health + amount, data.max_health)
	emit_signal("health_changed", data.current_health, data.max_health)

func die() -> void:
	emit_signal("died")
	get_parent().queue_free()
