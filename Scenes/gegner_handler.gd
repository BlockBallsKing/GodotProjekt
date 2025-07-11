extends Node2D

var enemy_scene = preload("res://Scenes/enemy01.tscn")
var player_body: CharacterBody2D = null

func _ready():
	var level = get_parent().get_node("Level")
	player_body = level.get_node("Player/CharacterBody2D")

	spawn_enemy(Vector2(600, 200))

func spawn_enemy(position: Vector2):
	var enemy = enemy_scene.instantiate()
	enemy.global_position = position
	enemy.player = player_body 
	print("✅ Spawning enemy at:", position)
	add_child(enemy)
