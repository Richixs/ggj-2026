extends Node
class_name Celda

var coords :Vector2
signal change_state_signal(coords)
signal turn_off_signal(celda)
@onready var timer = Timer.new()
# Called when the node enters the scene tree for the first time.
func change_state():
	change_state_signal.emit(coords)

func turn_off():
	turn_off_signal.emit(self)

func _ready() -> void:
	await get_tree().create_timer(1).timeout.connect(change_state)
	await get_tree().create_timer(0.5).timeout.connect(turn_off)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
