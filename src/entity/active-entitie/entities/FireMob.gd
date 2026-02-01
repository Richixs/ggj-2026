extends CharacterBody2D
class_name FireMob

@onready var entity := $Entity
@onready var movement := $ActiveEntity
@onready var anim := $AnimatedSprite2D

@export var home_target: Vector2 = Vector2.ZERO 
@export var stop_threshold: float = 10.0

var chase_target: CharacterBody2D = null

func _physics_process(_delta):
	var direction := Vector2.ZERO
	
	if chase_target:
		direction = global_position.direction_to(chase_target.global_position)
	else:
		if global_position.distance_to(home_target) > stop_threshold:
			direction = global_position.direction_to(home_target)
		else:
			direction = Vector2.ZERO
	
	movement.input_vector = direction
	movement.apply_movement(self)
	
	update_animation()
	update_flip()

func _on_detection_zone_body_entered(body: Node2D):
	if body is Player:
		chase_target = body

func _on_detection_zone_body_exited(body: Node2D):
	if body == chase_target:
		chase_target = null

func update_animation():
	if movement.input_vector != Vector2.ZERO:
		if anim.animation != "run":
			anim.play("run")
	else:
		if anim.animation != "IDLE":
			anim.play("IDLE")

func update_flip():
	if movement.input_vector.x != 0:
		anim.flip_h = movement.input_vector.x > 0
