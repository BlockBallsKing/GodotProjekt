extends Node2D
@onready var Vector1 = Vector2()
@onready var velocity = Vector2()
@onready var speed = 500
@onready var Animations = {
	"topright": "run topright",
	"right": "run right",
	"botright": "run botright",
	"bot": "run bot",
	"botleft": "run botleft",
	"top": "run top",
	"left": "run left",
	"topleft": "run topleft",
	
}

func getInput():
	Vector1 = Input.get_vector("links","rechts","oben","unten")
	velocity = Vector1 * speed
	print(velocity)
	
func Enter():
	print("entered" + self.name)

func exit():
	print("exited" + self.name)
