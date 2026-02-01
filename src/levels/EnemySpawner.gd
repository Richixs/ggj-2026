extends Node
class_name EnemySpawner

@export var fire_mob_scene: PackedScene = preload("res://scenes/active-entities/fire-mob/FireMob.tscn")
@export var mob_scene: PackedScene = preload("res://scenes/active-entities/mob/Mob.tscn")

@export var spawn_interval: float = 3.0
@export var max_enemies: int = 8

var spawn_timer: float = 0.0
var enemy_count: int = 0

# Dimensiones del mapa
var map_width: float = 3840.0
var map_height: float = 2160.0
var border_offset: float = 50.0

# Límites del mapa
var map_left: float = -1920.0
var map_right: float = 1920.0
var map_top: float = -1080.0
var map_bottom: float = 1080.0

func _ready():
	spawn_timer = spawn_interval

func _process(delta):
	spawn_timer -= delta
	
	# Contar enemigos vivos
	enemy_count = get_parent().get_tree().get_nodes_in_group("enemy").size()
	
	if spawn_timer <= 0 and enemy_count < max_enemies:
		spawn_random_enemy()
		spawn_timer = spawn_interval

func spawn_random_enemy():
	var enemy_type = randi() % 2
	var enemy_scene = fire_mob_scene if enemy_type == 0 else mob_scene
	var spawn_pos = get_random_spawn_position()
	
	var enemy = enemy_scene.instantiate()
	enemy.add_to_group("enemy")
	get_parent().add_child(enemy)
	enemy.global_position = spawn_pos
	
	print("Enemigo spawneado en: %s" % spawn_pos)

func get_random_spawn_position() -> Vector2:
	var side = randi() % 4
	var pos = Vector2.ZERO
	
	match side:
		0: # Arriba
			pos = Vector2(randf_range(map_left, map_right), map_top - border_offset)
		1: # Abajo
			pos = Vector2(randf_range(map_left, map_right), map_bottom + border_offset)
		2: # Izquierda
			pos = Vector2(map_left - border_offset, randf_range(map_top, map_bottom))
		3: # Derecha
			pos = Vector2(map_right + border_offset, randf_range(map_top, map_bottom))
	
	return pos
