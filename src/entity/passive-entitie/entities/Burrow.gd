extends PassiveEntity
class_name Burrow

const HURTBOX_SCRIPT = preload("res://src/entity/components/hurt-box/HurtBoxComponent.gd")

func _ready() -> void:
	var component = get_health_component()
	if component:
		if component.data:
			var vida_actual = component.data.current_health
			print("La vida de " + entity_name + " es: ", vida_actual)
		
		# Conectar señal de muerte
		component.died.connect(_on_died)
		
		# Configurar Hurtbox programáticamente para recibir daño
		_setup_hurtbox(component)
	else:
		print("Error: No se encontró el componente o el Resource de datos")

func _setup_hurtbox(health_comp) -> void:
	var hurtbox = Area2D.new()
	hurtbox.set_script(HURTBOX_SCRIPT)
	hurtbox.name = "HurtboxComponent"
	# Asignar el componente de salud al hurtbox
	hurtbox.health_component = health_comp
	
	# Setting collision layer to 8 (so enemies can hit it)
	hurtbox.collision_layer = 8 
	hurtbox.collision_mask = 0
	
	add_child(hurtbox)
	
	var collision = CollisionShape2D.new()
	var shape = RectangleShape2D.new()
	# Size increased to match the visual/physical size of the Burrow (approx 120 * 2.7)
	# plus a small buffer to ensure hitboxes overlap before physics bodies stop movement.
	shape.size = Vector2(350, 350) 
	collision.shape = shape
	hurtbox.add_child(collision)

# Cuando el Burrow muere (vida llega a 0)
func _on_died() -> void:
	call_deferred("_trigger_defeat")

func _trigger_defeat() -> void:
	get_tree().change_scene_to_file("res://scenes/pantallas_finales/derrota/derrota.tscn")
