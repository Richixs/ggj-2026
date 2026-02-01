extends Area2D
class_name HurtboxComponent

@export var health_component: HealthComponent

func receive_damage(amount: int) -> void:
	if health_component:
		health_component.take_damage(amount)
	else:
		push_error("HealthComponent no asignado en Hurtbox")
