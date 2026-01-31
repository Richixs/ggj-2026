extends PassiveEntity
class_name Burrow

func _ready() -> void:
	var component = get_health_component()
	if component and component.data:
		var vida_actual = component.data.current_health
		print("La vida de " + entity_name + " es: ", vida_actual)
	else:
		print("Error: No se encontró el componente o el Resource de datos")
