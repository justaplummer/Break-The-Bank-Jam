class_name asteroid
extends CharacterBody2D


const SPEED = 150
@export var damage_inflicted: int = 1

func _physics_process(delta: float) -> void:
	velocity.y = SPEED
	move_and_slide()

func initialize():
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("hit ship")
		var the_player: player = body
		the_player.hit_asteroid(damage_inflicted)
		print("player blow up animation")


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("area is detected")
	if area.is_in_group("missle"):
		var the_missile : missle = area
		the_missile.delete_self()
