class_name UI_Cargo
extends Control

@onready var pb_health: ProgressBar = $VBoxContainer/HBoxContainer/pb_health

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func reset_health_bar():
	pb_health.value = pb_health.max_value

func set_health_bar(value : float):
	pb_health.value = value	
	
