extends RigidBody2D

enum Type {
	dioxygen,
	diazote
}



export(Type) var type = Type.dioxygen
export(float) var speed_modif = 150


var old_velocity = null
var old_rotation = null
func _ready() -> void:
	if type == Type.dioxygen:
		$circle.modulate = Color.red
		$circle2.modulate = Color.red
	else:
		$circle.modulate = Color.blue
		$circle2.modulate = Color.blue
	$circle.visible = true
	$circle2.visible = true


func get_type():
	return type

func start():
	if not old_rotation or not old_velocity:	
		var sign_ = -1 if randf() > 0.5 else 1
		var sign_2 = -1 if randf() > 0.5 else 1
		linear_velocity = Vector2(sign_ * rand_range(0.5,1),sign_2 * rand_range(0.5,1))* speed_modif
	else:
		linear_velocity = old_velocity
		angular_velocity = old_rotation
	
func stop():
	old_velocity = linear_velocity
	old_rotation = angular_velocity
	
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
