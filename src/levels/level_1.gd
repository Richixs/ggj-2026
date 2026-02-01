extends Node2D

@export var cantidad_arboles :int = 20
@export var distance_borrow : int = 200

var random := RandomNumberGenerator.new()
var tree = preload("res://scenes/passive-entities/tree/tree.tscn")

func create_tree(position:Vector2):
	var tree_instance :Node2D= tree.instantiate()
	tree_instance.global_position = position
	add_child(tree_instance)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	random.randomize()
	var i = 0
	while i < cantidad_arboles:
		var pos = Vector2(random.randf_range(-1600,1600),random.randf_range(-930,930))
		if pos.distance_to(Vector2.ZERO) >= distance_borrow:
			i +=1
			create_tree(pos)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
