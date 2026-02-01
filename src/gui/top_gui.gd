extends Control

@onready var player :Player = get_tree().get_first_node_in_group("player")
@onready var burrow :Burrow = get_tree().get_first_node_in_group("burrow")

@onready var textures :Array[TextureRect] = [
		$HBoxContainer/PanelLifes/TextureRect,
		$HBoxContainer/PanelLifes/TextureRect2,
		$HBoxContainer/PanelLifes/TextureRect3
		]

func change_lose_scene():
	get_tree().call_deferred("change_scene_to_file","res://scenes/pantallas_finales/derrota/derrota.tscn")
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if player != null:
		var hp_player = player.get_health_component().data.current_health
		if hp_player == 3:
			textures[0].visible = false
		elif hp_player == 2:
			textures[1].visible = false
		elif hp_player == 1:
			textures[2].visible = false
		else:
			print("Perdiste")
			change_lose_scene()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if burrow != null:
		if burrow.get_health_component().data.current_health == 0:
			change_lose_scene()
	pass


func _on_timer_timeout() -> void:
	change_lose_scene()
	pass # Replace with function body.
