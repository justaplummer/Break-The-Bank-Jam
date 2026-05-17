class_name main
extends Node

@export var asteroid_scene: PackedScene
@onready var ui_cargo: UI_Cargo = $UI_cargo

var min_x = 225
var max_x = 575
var min_y = -25
var max_y = -100

func _ready() -> void:
	ui_cargo.reset_health_bar()

func _on_asteroid_spawner_timeout() -> void:
	# Create a new instance of the Mob scene.
	var asteroid_to_spawn: asteroid = asteroid_scene.instantiate()
	asteroid_to_spawn.initialize()
	asteroid_to_spawn.position = get_asteroid_spawn_location()
	# Spawn the mob by adding it to the Main scene.
	add_child(asteroid_to_spawn)
	
func get_asteroid_spawn_location() -> Vector2:
	var X = randf_range(min_x,max_x)
	var Y = randf_range(min_y,max_y)
	return Vector2(X,Y)
