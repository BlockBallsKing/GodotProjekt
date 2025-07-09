extends CharacterBody2D
@onready var Animator = get_node("AnimatedSprite2D")
@export var Direction = Vector2(0,0)
@onready var Velocity = 5


func  _ready() -> void:
	Animator.play("default")
	
	
func _process(delta: float) -> void:
	print("gfgffsdgfsdgfsdgfdsg")


func _on_animated_sprite_2d_animation_finished() -> void:
	self.get_parent().remove_child(self)


func _on_animated_sprite_2d_animation_looped() -> void:
	self.get_parent().remove_child(self)
