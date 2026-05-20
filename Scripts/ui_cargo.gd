class_name UI_Cargo
extends Control

@onready var pb_health: ProgressBar = $VBoxContainer/HBoxContainer/pb_health
@onready var pb_progress: ProgressBar = $VBoxContainer/HBoxContainer3/pb_progress

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
	
func reset_progress_bar():
	pb_progress.value = 0

func set_progress_bar_max(max_value):
	pb_progress.max_value = max_value
	
func update_progress_bar(value):
	pb_progress.value = value
	
