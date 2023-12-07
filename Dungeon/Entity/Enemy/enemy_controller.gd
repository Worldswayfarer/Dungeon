extends Node2D


@export var _enemy_scene : PackedScene 

var Screen_size = Vector2.ZERO
var _offset = 20

func _ready():
	Screen_size = get_viewport_rect().size
	print(Screen_size)
	randomize()
	spawnEnemies()


func spawnEnemies(count = 10):
	for number in range(count):
		var new_enemy = _enemy_scene.instantiate()
		var new_position = Vector2(randi_range(Screen_size.x + _offset, Screen_size.x - _offset) - Screen_size.x,
				 randi_range(Screen_size.y + _offset, Screen_size.y - _offset) - Screen_size.y)
		new_enemy.position = new_position
		add_child(new_enemy)
