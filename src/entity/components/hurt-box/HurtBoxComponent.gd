extends Area2D
class_name HurtboxComponent

@export var health_component: HealthComponent

func receive_damage(amount: int, attacker: Node = null) -> void:
	if health_component:
		health_component.take_damage(amount)
		
		# Si el que recibe daño es el Player, el atacante muere
		if get_parent().is_in_group("player") and attacker != null:
			if attacker.has_node("HealthComponent"):
				var attacker_health = attacker.get_node("HealthComponent")
				print("%s contraatacó y mató a %s" % [get_parent().name, attacker.name])
				attacker_health.take_damage(999)  # Daño letal
	else:
		push_error("HealthComponent no asignado en Hurtbox")
