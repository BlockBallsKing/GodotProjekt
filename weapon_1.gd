extends Node2D

@export var BaseTargets = 3
@export var BaseRange = "mittel"
@export var Name = "Weapon1"
@export var Freq = 1.0
@export var ready2  = true
@onready var ShotTimer = get_node("Timer")

func _ready() -> void:
	ShotTimer.set_wait_time(Freq)
	ShotTimer.start()

func _process(delta: float) -> void:
	pass
	





func _on_timer_timeout() -> void:
	ready2 = not ready2
	
