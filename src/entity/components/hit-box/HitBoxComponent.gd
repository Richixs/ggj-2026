extends Area2D
class_name HitboxComponent

@export var damage_amount: int = 1

func _ready():
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D):
	if area is HurtboxComponent:
		area.receive_damage(damage_amount, get_parent())
