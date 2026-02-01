extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Basic Action"):
		get_tree().call_deferred("change_scene_to_file","res://scenes/levels/Level1.tscn")

	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "anim":
		get_tree().call_deferred("change_scene_to_file","res://scenes/levels/Level1.tscn")
	pass # Replace with function body.
