class_name FireSystem extends Node

@export var terrain_layer: TileMapLayer
@export var fire_layer: TileMapLayer
@export var tick_speed: float = 0.1
@export var propagation_chance: float = 0.6

const COORD_FIRE = Vector2i(0, 0) 
const COORD_ASH = Vector2i(1, 0)

var active_fires: Dictionary = {}

const NEIGHBORS = [Vector2i.UP, Vector2i.DOWN, Vector2i.LEFT, Vector2i.RIGHT]

@onready var timer: Timer = $TickTimer

func _ready() -> void:
	timer.wait_time = tick_speed
	timer.timeout.connect(_on_tick)
	timer.start()

func ignite_cell(coords: Vector2i) -> void:
	if not _is_flammable(coords):
		return
	if active_fires.has(coords) or _is_ash(coords):
		return
	_add_fire(coords)

func _on_tick() -> void:
	if active_fires.is_empty():
		return
	
	# Usamos una lista temporal para los nuevos fuegos de este ciclo
	# para no iterar sobre los que acabamos de crear en el mismo tick.
	var next_fires_coords: Array[Vector2i] = []
	var fires_to_extinguish: Array[Vector2i] = []
	
	# --- Paso 1: Procesar propagación ---
	for fire_pos in active_fires:
		# Intentar propagar a los 4 vecinos
		for offset in NEIGHBORS:
			var neighbor_pos = fire_pos + offset
			
			# Lógica de propagación
			if _can_spread_to(neighbor_pos):
				# Probabilidad (Opcional)
				if randf() <= propagation_chance:
					next_fires_coords.append(neighbor_pos)
		
		# El fuego actual se consume en 1 tick (según tus reglas)
		fires_to_extinguish.append(fire_pos)

	# --- Paso 2: Actualizar Estado Lógico y Visual (Batch Update) ---
	
	# A. Convertir fuegos viejos en ceniza
	for pos in fires_to_extinguish:
		active_fires.erase(pos) # Lo sacamos de la simulación activa
		fire_layer.set_cell(pos, 0, COORD_ASH) # Visual: Ceniza
	
	for pos in next_fires_coords:
		if not active_fires.has(pos): # Evitar duplicados en esquinas
			_add_fire(pos)


func _add_fire(pos: Vector2i) -> void:
	active_fires[pos] = true
	fire_layer.set_cell(pos, 0, COORD_FIRE) # Visual: Fuego

func _is_flammable(pos: Vector2i) -> bool:
	# Obtenemos la data del terreno base.
	# Si no hay tile, devuelve null.
	var tile_data = terrain_layer.get_cell_tile_data(pos)
	if tile_data:
		return tile_data.get_custom_data("flammability") == 1
	return false

func _is_ash(pos: Vector2i) -> bool:
	# Verificamos si en la capa de fuego ya hay ceniza
	return fire_layer.get_cell_atlas_coords(pos) == COORD_ASH

func _can_spread_to(pos: Vector2i) -> bool:
	# 1. No debe estar ya en fuego
	if active_fires.has(pos): return false
	# 2. No debe ser ceniza
	if _is_ash(pos): return false
	# 3. Debe ser terreno quemable (Césped)
	return _is_flammable(pos)
