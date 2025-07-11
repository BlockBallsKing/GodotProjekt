extends Node2D

@export var BaseTargets = 10
@export var BaseRange = "kurz"
@export var Name = "Weapon1"
@export var Freq = 0.2
@export var ready2  = true
@onready var ShotTimer = get_node("Timer")
@export var shot = preload("res://Weapons/shots/hit_1.tscn")
@export var switch = false

func _ready() -> void:
	ShotTimer.set_wait_time(Freq)
	ShotTimer.start()

func _process(delta: float) -> void:
	pass
	






	


func _on_timer_timeout() -> void:
	ready2 = not ready2
