extends Control

@onready var player :Player = get_tree().get_first_node_in_group("player")

@onready var textures :Array[TextureRect] = [
		$HBoxContainer/PanelLifes/TextureRect,
		$HBoxContainer/PanelLifes/TextureRect2,
		$HBoxContainer/PanelLifes/TextureRect3
		]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if player != null:
		var hp_player = player.get_health_component().data.current_health
		if hp_player <= 100:
			textures[0].visible = false
		elif hp_player <= 67:
			textures[1].visible = false
		elif hp_player <= 34:
			textures[2].visible = false
		else:
			print("Perdiste")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
