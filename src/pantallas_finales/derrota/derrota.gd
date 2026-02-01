extends Control

var fire_sound = preload("res://assets/Audio/fire.ogg")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var audio_player = AudioStreamPlayer.new()
	audio_player.stream = fire_sound
	audio_player.bus = "SFX"
	add_child(audio_player)
	audio_player.play()
	# Ensure looping
	audio_player.finished.connect(func(): audio_player.play())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file","res://scenes/Main.tscn")
	pass # Replace with function body.
