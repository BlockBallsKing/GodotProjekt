extends CharacterBody2D
@onready var speed = 500;
@onready var Animator;
@onready var Vector1;
@onready var prevdirection = 0
@onready var Cam = get_node("Camera2D")
@onready var bg = get_node("Sprite2D")
@onready var state = get_node("States").get_child(0)
@onready var Level = self.get_parent().get_parent()

@onready var Weapon1pre = preload("res://Weapons/weapon_1.tscn")
@onready var Weapon2pre = preload("res://Weapons/weapon_2.tscn")
@onready var Weapon1 = Weapon1pre.instantiate()
@onready var Weapon2 = Weapon2pre.instantiate()
@onready var Weapons = get_node("Weapons")
@onready var Weaponbools = []
@onready var kurz = []
@onready var mittel = []
@onready var lang = []
@onready var kurzArea = get_node("Ranges").get_node("kurz")
@onready var langArea = get_node("Ranges").get_node("lang")
@onready var mittelArea = get_node("Ranges").get_node("mittel")
@onready var Shotpre = preload("res://Weapons/shots/shot_1.tscn")
@onready var Weapon3pre = preload("res://Weapons/weapon_kurz.tscn")
@onready var Weapon3 = Weapon3pre.instantiate()






func _ready():
	Cam.enabled = true
	
	Animator = get_node("CharacterAnimation")
	Weapons.add_child(Weapon1)
	Weapons.add_child(Weapon2)
	Weapons.add_child(Weapon3)
	


func getWeaponReady():
	for child in Weapons.get_children():
		if child.switch != child.ready2:
			child.switch = bool(child.ready2)
			getTarget(child)
		 
func getTarget(Weapon):
	var targets = []
	kurz = kurzArea.get_overlapping_bodies()
	mittel = mittelArea.get_overlapping_bodies()
	lang  = langArea.get_overlapping_bodies()
	match(Weapon.BaseRange):
		"kurz":
			
			
			kurz.sort_custom(func(a, b):
				return a.global_position.distance_to(self.global_position) < b.global_position.distance_to(self.global_position))
			targets = kurz.slice(0,Weapon.BaseTargets)
		"mittel":
			
			mittel.sort_custom(func(a, b):
				return a.global_position.distance_to(self.global_position) < b.global_position.distance_to(self.global_position))
			targets = mittel.slice(0,Weapon.BaseTargets)
			
		"lang":
			
			lang.sort_custom(func(a, b):
				return a.global_position.distance_to(self.global_position) < b.global_position.distance_to(self.global_position))
			targets = lang.slice(0,Weapon.BaseTargets)
	print(targets)
	for x in targets:
		var y = Weapon.shot.instantiate()
		y.Direction = self.global_position.direction_to(x.global_position)
		y.position = self.position
		Level.add_child(y)
	
		
		
		
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
	getWeaponReady()
	velocity = state.velocity
	state.getInput()
	print(position)
	Animation(state.Animations,state.velocity)
	move_and_slide()
	
