extends CharacterBody2D
@onready var speed = 500;
@onready var Animator;
@onready var Vector1;
@onready var prevdirection = 0
@onready var Cam = get_node("Camera2D")
@onready var bg = get_node("Sprite2D")
var Run = {
	"botright": "run botright",
	"topright": "run topright",
	"botleft": "run botleft",
	"topleft": "run topleft",
	"right": "run right",
	"left": "run left",
	"bot": "run bot",
	"top": "run top"
	
	
	
}


func _ready():
	Cam.enabled = true
	Animator = get_node("AnimatedSprite2D")

func getInput():
	Vector1 = Input.get_vector("links","rechts","oben","unten")
	velocity = Vector1 * speed
	print(velocity)
	
func RunAnimation():
	var x = velocity.x > 0
	var y = velocity.y > 0
	var z = velocity.x < 0
	var w = velocity.y < 0
	var t = velocity.x == 0
	var r = velocity.y == 0
	 
	if x and y:
		Animator.play("botright")
		prevdirection = 4
	elif x and w:
		Animator.play("topright")
		prevdirection = 2
	elif y and z:
		Animator.play("botleft")
		prevdirection = 6
	elif z and w:
		Animator.play("topleft")
		prevdirection = 8
	elif x:
		Animator.play("right")
		prevdirection = 3
	elif z:
		Animator.play("left")
		prevdirection = 7
	elif y:
		Animator.play("bot")
		prevdirection = 5
	elif w:
		Animator.play("top")
		prevdirection = 1
	if t and r:
		match(prevdirection):
			1:
				Animator.play("idle top")
			2:
				Animator.play("idle topright")
			3:
				Animator.play("idle right")
			4:
				Animator.play("idle botright")
			5:
				Animator.play("idle bot")
			6:
				Animator.play("idle botleft")
			7:
				Animator.play("idle left")
			8:
				Animator.play("idle topleft")	
			
			
			
		
	
	
func _process(delta):
	
	getInput()
	RunAnimation()
	var collision = move_and_collide(velocity*delta)
	if collision:
		if collision.get_collider().has_method("lol"):
			collision.get_collider().lol()
	
	
			
			
