extends Node2D  

@export var wobble_amount: float = 2.0
@export var wobble_speed: float = 3.0

var original_position: Vector2
var time_passed: float = 0.0

func _ready():
	original_position = position

func _process(delta):
	time_passed += delta
	var offset_x = sin(time_passed * wobble_speed * TAU) * wobble_amount
	var offset_y = cos(time_passed * wobble_speed * TAU) * wobble_amount
	position = original_position + Vector2(offset_x, offset_y)
