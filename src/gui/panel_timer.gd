extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#comment
	$Timer.start(90)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var time:=Time.get_offset_string_from_offset_minutes($Timer.time_left)
	time = time.substr(1)
	$Label.text = time
	pass
