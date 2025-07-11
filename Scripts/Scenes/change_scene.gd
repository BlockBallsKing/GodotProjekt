extends Node2D

@export var scene:PackedScene

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_packed(scene)


func _on_exit_pressed() -> void:
	get_tree().quit();


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/option_menu.tscn");


func _on_new_game_mouse_entered() -> void:
	pass # Replace with function body.
