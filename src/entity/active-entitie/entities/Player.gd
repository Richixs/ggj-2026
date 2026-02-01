extends CharacterBody2D
class_name Player

@onready var entity := $Entity
@onready var movement := $ActiveEntity
@onready var anim := $AnimatedSprite2D
@onready var attack_hitbox := $HitboxComponent
@onready var attack_timer := $AttackTimer
@onready var attack_visual := $HitboxComponent/AttackVisual

var is_attacking := false
var attack_offset_left := Vector2(-300, 0)
var attack_offset_right := Vector2(300, 0)

func _ready():
	attack_visual.visible = false

func _physics_process(_delta):
	movement.input_vector = Input.get_vector("Left", "Right", "Up", "Down")
	movement.apply_movement(self)
	update_animation()
	update_flip()
	update_attack_position()

func _unhandled_input(event):
	if event.is_action_pressed("Basic Action") and not is_attacking:
		perform_attack()

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

func perform_attack():
	is_attacking = true
	attack_hitbox.monitoring = true
	print("Player atacó!")
	attack_timer.start()

func update_attack_position():
	if anim.flip_h:
		attack_hitbox.position = attack_offset_right
		attack_visual.scale.x = 1
	else:
		attack_hitbox.position = attack_offset_left
		attack_visual.scale.x = -1

func _on_attack_timer_timeout():
	is_attacking = false
	attack_hitbox.monitoring = false
