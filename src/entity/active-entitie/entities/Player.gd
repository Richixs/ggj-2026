extends ActiveEntity
class_name Player

func _ready() -> void:
	var component = get_health_component()
	if component and component.data:
		var vida_actual = component.data.current_health
		print("La vida de " + entity_name + " es: ", vida_actual)
	else:
		print("Error: No se encontró el componente o el Resource de datos")

func _physics_process(delta: float) -> void:
	input_vector = Input.get_vector("Left", "Right", "Up", "Down")    
	super._physics_process(delta)
	
