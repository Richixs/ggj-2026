extends TileMapLayer

enum state {VERDE, BRAZA, CENIZA}
#var state_cells = []

var filas = 50
var columnas = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(filas):
		for j in range(columnas):
			#set_cells_terrain_connect()
			set_cell(Vector2i(i,j),0,Vector2i(1,1))
	#for i in range(50):
		#var fila = []
		#for j in range(5):
			#fila.append(state.VERDE)
		#state_cells.append(fila)
	#print(state_cells)
	pass # Replace with function body.

func change_state_cell(coords: Vector2i):
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
	if Input.is_action_just_pressed("Basic Action"):
		change_state_cell(local_to_map(get_global_mouse_position()))
	#var position_mouse_map = local_to_map(get_global_mouse_position())
	#if position_mouse_map >= Vector2i.ZERO:
		#if get_cell_source_id(position_mouse_map) == 0:
			#
	pass
