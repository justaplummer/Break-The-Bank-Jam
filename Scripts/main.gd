class_name main
extends Node

@export var asteroid_scene: PackedScene
@onready var ui_cargo: UI_Cargo = $UI_cargo
@onready var mission_length: Timer = $timers/Mission_Length
@onready var asteroid_spawner: Timer = $timers/Asteroid_Spawner
@onready var player: Player = $Center_Game/Player
@onready var button_reset_mission: Button = $Button_reset_mission

var min_x = 225
var max_x = 575
var min_y = -25
var max_y = -100

var shipping_path_length : int = 5 #this is how long the player will play the mission in between investments time is in seconds

func _ready() -> void:
	ui_cargo.reset_health_bar()
	ui_cargo.set_progress_bar_max(shipping_path_length)
	ui_cargo.reset_progress_bar()
	mission_length.start(shipping_path_length)

func _process(delta: float) -> void:
	var progress_made = shipping_path_length - mission_length.time_left
	ui_cargo.update_progress_bar(progress_made)
	
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


func _on_mission_length_timeout() -> void:
	print("end of mission!")
	asteroid_spawner.stop()
	player.set_mission_active(false)
	delete_all_asteroids()
	button_reset_mission.disabled = false
	

func delete_all_asteroids():
	for node in get_tree().get_nodes_in_group("asteroid"): 
		node.queue_free()
		
func _unhandled_input(event: InputEvent) -> void:
	pass

func _on_button_pressed() -> void:
	player.set_mission_active(true)
	asteroid_spawner.start(1)
	ui_cargo.reset_progress_bar()
	mission_length.start(shipping_path_length)
	button_reset_mission.disabled = true
	
	
