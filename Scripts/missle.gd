class_name missle
extends Area2D
@export var speed = 250

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta):
	position += -transform.y * speed * delta
	if is_out_of_view():
		delete_self()

func is_out_of_view():
	return position.y < -1
	
func delete_self():
	queue_free()
