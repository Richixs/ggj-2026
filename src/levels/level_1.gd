extends Node2D

@export var cantidad_arboles :int = 8
@export var distance_borrow : int = 500

var arboles :Array[Node2D]= []
var random := RandomNumberGenerator.new()
var tree = preload("res://scenes/passive-entities/tree/tree.tscn")
var fire_sound = preload("res://assets/Audio/fire.ogg")

func create_tree(position:Vector2):
	var tree_instance :Node2D= tree.instantiate()
	tree_instance.global_position = position
	add_child(tree_instance)
	arboles.append(tree_instance)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var audio_player = AudioStreamPlayer.new()
	audio_player.stream = fire_sound
	audio_player.bus = "SFX"
	add_child(audio_player)
	audio_player.play()
	# Ensure looping using signal if the stream itself isn't set to loop
	audio_player.finished.connect(func(): audio_player.play())

	random.randomize()
	var i = 0
	while i < cantidad_arboles:
		var pos = Vector2(random.randf_range(-1600,1600),random.randf_range(-930,930))
		if pos.distance_to(Vector2.ZERO) >= distance_borrow:
			if not arboles.is_empty():
				var can_create_tree = true
				for tree in arboles:
					if pos.distance_to(tree.global_position) < 500:
						can_create_tree = false
				if can_create_tree:
					i +=1
					create_tree(pos)
			else:
				i += 1
				create_tree(pos)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

