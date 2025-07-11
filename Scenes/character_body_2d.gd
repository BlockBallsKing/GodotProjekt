extends CharacterBody2D
@onready var Animator = get_node("AnimatedSprite2D")
@export var Direction = Vector2(0,0)
@onready  var Velocity = 5

func  _ready() -> void:
	Animator.play("2")
	
	
func _process(delta: float) -> void:
	var tempDirection = Direction * Velocity
	self.position += tempDirection 
	
	
	
	
