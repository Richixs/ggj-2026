extends Control

@onready var animation := $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true
	animation.play("fade_out")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match  anim_name:
		"fade_out":
			get_tree().paused = false
			print("pause false")
	pass # Replace with function body.
