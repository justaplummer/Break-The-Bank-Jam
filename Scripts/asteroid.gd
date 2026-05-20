class_name asteroid
extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var hit_count = 0
const SPEED = 150
@export var damage_inflicted: int = 10
@export var max_health: int = 5
var cur_health

func _ready() -> void:
	cur_health = max_health
	animated_sprite_2d.frame = hit_count

func _physics_process(delta: float) -> void:
	velocity.y = SPEED
	move_and_slide()

func initialize():
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var the_player: Player = body
		the_player.hit_asteroid(damage_inflicted)
		take_damage(max_health) #the player ship hitting an asteroid will automatically kill it


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("missle"):
		var the_missile : missle = area
		the_missile.delete_self()
		take_damage(1)

func take_damage(damage:int):
	cur_health -= damage
	if cur_health <= 0:
		death_animation()
	else:
		hit_count += 1
		animated_sprite_2d.frame = hit_count
		
func death_animation():
	#play a death animation and then queue_free()
	queue_free()
