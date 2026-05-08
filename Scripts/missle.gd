class_name missle
extends Node2D
@export var speed = 250

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta):
	position += -transform.y * speed * delta
