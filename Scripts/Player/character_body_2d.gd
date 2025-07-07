extends CharacterBody2D
@onready var speed = 500;
@onready var Animator;
@onready var Vector1;
@onready var prevdirection = 0
@onready var Cam = get_node("Camera2D")
@onready var bg = get_node("Sprite2D")
@onready var state = get_node("States").get_child(0)




func _ready():
	Cam.enabled = true
	Animator = get_node("AnimatedSprite2D")


	
func Animation(Animations,velocityt):
	var x = velocityt.x > 0
	var y = velocityt.y > 0
	var z = velocityt.x < 0
	var w = velocityt.y < 0
	var t = velocityt.x == 0
	var r = velocityt.y == 0
	
	if x and y:
		Animator.play(Animations["botright"])
		prevdirection = 4
	elif x and w:
		Animator.play(Animations["topright"])
		prevdirection = 2
	elif y and z:
		Animator.play(Animations["botleft"])
		prevdirection = 6
	elif z and w:
		Animator.play(Animations["topleft"])
		prevdirection = 8
	elif x:
		Animator.play(Animations["right"])
		prevdirection = 3
	elif z:
		Animator.play(Animations["left"])
		prevdirection = 7
	elif y:
		Animator.play(Animations["bot"])
		prevdirection = 5
	elif w:
		Animator.play(Animations["top"])
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
	velocity = state.velocity
	state.getInput()
	Animation(state.Animations,state.velocity)
	move_and_slide()
	print(global_position)
	
	
			
			
