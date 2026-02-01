extends Control

@export var level :PackedScene

var menu_music = load("res://assets/Audio/menu.ogg")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var audio_player = AudioStreamPlayer.new()
	audio_player.stream = menu_music
	audio_player.bus = "Musica"
	add_child(audio_player)
	audio_player.play()
	# Ensure looping
	audio_player.finished.connect(func(): audio_player.play())
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


func _on_exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
