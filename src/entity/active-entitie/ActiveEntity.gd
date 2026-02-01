extends Node
class_name ActiveEntity

@export var speed := 200.0
var input_vector := Vector2.ZERO

func apply_movement(body: CharacterBody2D):
	body.velocity = input_vector * speed
	body.move_and_slide()
