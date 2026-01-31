extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.

func get_state_cell(position:Vector2):
	var coords = local_to_map(position)
	return get_cell_source_id(coords)
	

func change_state_cell(position: Vector2):
	var coords = local_to_map(position)
	var cell_atlas_coords = get_cell_atlas_coords(coords)
	var state = get_cell_source_id(coords)
	match state:
		0:
			set_cell(coords,1,cell_atlas_coords)
		1:
			set_cell(coords,2,cell_atlas_coords)
		2:
			set_cell(coords,0,cell_atlas_coords)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
