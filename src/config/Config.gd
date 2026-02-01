extends Control

@onready var MasterSlider := $VBoxContainer/Slider_Master
@onready var SFXSlider := $VBoxContainer/Slider_SFX
@onready var MusicSlider := $VBoxContainer/Slider_Music
@onready var CinematicSlider := $VBoxContainer/Slider_Cinematica

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MasterSlider.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	SFXSlider.value = db_to_linear(AudioServer.get_bus_volume_db(1))
	MusicSlider.value = db_to_linear(AudioServer.get_bus_volume_db(3))
	CinematicSlider.value = db_to_linear(AudioServer.get_bus_volume_db(2))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_return_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file","res://scenes/menu/Menu.tscn")
	pass # Replace with function body.


func _on_slider_master_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,linear_to_db(value))
	pass # Replace with function body.


func _on_slider_music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(3,linear_to_db(value))
	pass # Replace with function body.


func _on_slider_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1,linear_to_db(value))
	pass # Replace with function body.


func _on_slider_cinematica_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2,linear_to_db(value))
	pass # Replace with function body.
