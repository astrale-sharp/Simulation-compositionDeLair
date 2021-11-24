extends CollisionShape2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _draw() -> void:
	shape.draw(get_canvas_item(),Color.darkgoldenrod)
