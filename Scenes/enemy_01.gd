extends CharacterBody2D

@export var speed := 100.0
var player: CharacterBody2D

func _physics_process(delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
