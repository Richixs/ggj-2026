extends CanvasLayer

@onready var label = $Control/Panel/Label
@onready var timer = $Control/Panel/Timer

func _ready() -> void:
	timer.start(90) # 1 minute 30 seconds

func _process(delta: float) -> void:
	var time_left = timer.time_left
	var minutes = floor(time_left / 60)
	var seconds = int(time_left) % 60
	label.text = "%02d:%02d" % [minutes, seconds]

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/pantallas_finales/victoria/win_screen.tscn")
