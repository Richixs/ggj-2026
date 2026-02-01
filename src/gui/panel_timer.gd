extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#comment
	$Timer.start(90)
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var time_left = $Timer.time_left
	var minutes = floor(time_left / 60)
	var seconds = int(time_left) % 60
	$Label.text = "%02d:%02d" % [minutes, seconds]
