extends Node2D


@export var _enemy_scene : PackedScene 

var Screen_size = Vector2.ZERO


func _ready():
	Screen_size = get_viewport_rect().size
	randomize()
	spawnEnemies()


func spawnEnemies(count = 10):
	for number in range(count):
		var new_enemy = _enemy_scene.instantiate()
		var new_position = Vector2(randi_range(50, Screen_size.x - 50), randi_range(50, Screen_size.y - 50))
		new_enemy.position = new_position
		add_child(new_enemy)
