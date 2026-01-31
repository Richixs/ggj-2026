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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#for i in range(5):
		#for j in range(5):
			#if state_cells[i][j] == state.VERDE:
				#set_cell(Vector2i(i,j),0,Vector2i(1,9))
	pass
