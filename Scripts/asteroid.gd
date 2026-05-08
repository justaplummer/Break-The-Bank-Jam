extends CharacterBody2D


const SPEED = 150


func _physics_process(delta: float) -> void:
	velocity.y = SPEED
	move_and_slide()
