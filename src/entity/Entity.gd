extends Node2D
class_name Entity

@export var entity_name: String = "Entity"

func get_health_component() -> HealthComponent:
	return get_node_or_null("HealthComponent")
