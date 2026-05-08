class_name player
extends CharacterBody2D

@export var missle_scene :PackedScene
@export var speed = 200
var x_min = 225
var x_max = 575
var y_min = 25
var y_max = 575
var max_health = 10
var current_health = max_health 

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
func get_fired_input():
	if Input.is_action_just_pressed("ui_accept"):
		fire_missle()

func _physics_process(delta):
	get_input()
	get_fired_input()
	move_and_slide()
	#position += velocity * delta
	position.x = clamp(position.x, x_min, x_max)
	position.y = clamp(position.y, y_min, y_max)
	
func hit_asteroid(health_subtract : int):
	current_health -= health_subtract
	if current_health < 0:
		print("SHIP IS STRANDED!")

func fire_missle():
	var missle_to_spawn: missle = missle_scene.instantiate()
	missle_to_spawn.position = position
	# Spawn the mob by adding it to the Main scene.
	get_parent().add_child(missle_to_spawn)
