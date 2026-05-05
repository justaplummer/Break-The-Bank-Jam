extends CharacterBody2D

@export var speed = 200
var x_min = 225
var x_max = 575
var y_min = 25
var y_max = 575

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	#position += velocity * delta
	position.x = clamp(position.x, x_min, x_max)
	position.y = clamp(position.y, y_min, y_max)
