extends TileMapLayer
class_name Terreno
# corregir que no cambie del estado ceniza a verde al esparcirse

var state_cells = []
var direction =[Vector2.UP,Vector2.DOWN,Vector2.RIGHT,Vector2.LEFT]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.

func turn_off_celda(celda):
	var cell :Celda = celda
	var state = get_state_cell(cell.coords)
	if state == 1:
		change_state_cell(cell.coords)
		state_cells.erase(celda)

func get_state_cell(position:Vector2):
	var coords = local_to_map(position)
	return get_cell_source_id(coords)

func propagar_fuego(position:Vector2):
	for dir in direction:
		var state = get_state_cell(position + dir * 64)
		if state == 0:
			change_state_cell(position + dir * 64)

func change_state_cell(position: Vector2):
	var coords = local_to_map(position)
	var cell_atlas_coords = get_cell_atlas_coords(coords)
	var state = get_cell_source_id(coords)
	match state:
		0:
			set_cell(coords,1,cell_atlas_coords)
			var celda = Celda.new()
			celda.coords = position
			celda.connect("turn_off_signal",turn_off_celda)
			celda.connect("change_state_signal",propagar_fuego)
			add_child(celda)
			state_cells.append(celda)
		1:
			print("estado braza")
			set_cell(coords,2,cell_atlas_coords)
		2:
			print("estado ceniza")
			set_cell(coords,0,cell_atlas_coords)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(state_cells)
	if Input.is_action_just_pressed("Basic Action"):
		change_state_cell(get_global_mouse_position())

	pass
