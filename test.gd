extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var diox = preload("res://molecules/dioxygene.tscn")
	var diaz = preload("res://molecules/diazote.tscn")
	randomize()
	$bocal/gestion_spatiale_molecules.random_populate([diox,diaz],10)
	$bocal.start()
