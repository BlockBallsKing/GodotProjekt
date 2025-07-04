extends Sprite2D
@onready var x = Vector2(5,5)
@onready var switch = false


func _process(delta):
	rotate(0.3)
	if x.x < 4 and not switch:
		switch = true
	elif x.x > 20 and switch:
		switch = false
	
	if not switch:
		x.x = x.x * 0.8
		x.y = x.y * 0.8
	else: 
		x.x = x.x * 1.2
		x.y = x.y * 1.2
	scale = x
	print(scale)
