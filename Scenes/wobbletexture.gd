extends TextureButton

# Stärke des Wackelns in Pixeln
@export var wobble_amount: float = 1.0
# Geschwindigkeit des Wackelns (Hz)
@export var wobble_speed: float = 0.50

var original_position: Vector2
var time_passed: float = 0.0
var phase_offset: float = 0.0

func _ready():
	original_position = position
	phase_offset = randf() * TAU  # zufälliger Versatz von 0 bis 2π

func _process(delta):
	time_passed += delta
	var offset_x = sin(time_passed * wobble_speed * TAU + phase_offset) * wobble_amount
	var offset_y = cos(time_passed * wobble_speed * TAU + phase_offset) * wobble_amount
	position = original_position + Vector2(offset_x, offset_y)
