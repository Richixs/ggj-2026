extends Control

@export var level :PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_config_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file","res://scenes/config/Config.tscn")
	pass # Replace with function body.


func _on_start_pressed() -> void:
	get_tree().call_deferred("change_scene_to_packed",level)
	
	pass # Replace with function body.
