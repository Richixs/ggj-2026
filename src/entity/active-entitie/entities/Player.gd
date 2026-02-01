extends CharacterBody2D
class_name Player

@onready var entity := $Entity
@onready var movement := $ActiveEntity
@onready var anim := $AnimatedSprite2D

func _physics_process(delta):
	movement.input_vector = Input.get_vector("Left", "Right", "Up", "Down")
	movement.apply_movement(self)
	update_animation()
	update_flip()

func update_animation():
	if movement.input_vector != Vector2.ZERO:
		if anim.animation != "run":
			anim.play("run")
	else:
		if anim.animation != "IDLE":
			anim.play("IDLE")

func update_flip():
	if movement.input_vector.x < 0:
		anim.flip_h = false
	elif movement.input_vector.x > 0:
		anim.flip_h = true
