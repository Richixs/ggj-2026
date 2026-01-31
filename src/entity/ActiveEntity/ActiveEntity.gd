extends Entity
class_name ActiveEntity

@export var speed: float = 200.0
var input_vector: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	if "velocity" in self:
		self.set("velocity", input_vector * speed)    
	if self.has_method("move_and_slide"):
		self.call("move_and_slide")
	if input_vector.x != 0 and has_node("AnimatedSprite2D"):
		$AnimatedSprite2D.flip_h = input_vector.x < 0
