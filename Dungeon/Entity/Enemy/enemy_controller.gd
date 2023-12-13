extends Node2D


@export var _enemy_scene : PackedScene 


var Screen_size = Vector2.ZERO
var _offset = 20
var _enemies_spawned = 0

func _ready():
	Signals.enemy_death.connect(handle_enemy_death)
	
	Screen_size = get_viewport_rect().size
	print(Screen_size)
	randomize()
	spawnEnemies()


func handle_enemy_death(object):
	_enemies_spawned -= 1
	if _enemies_spawned == 0:
		#end of wave
		pass


func spawnEnemies(count = 10):
	_enemies_spawned = count
	for number in range(count):
		var new_enemy = _enemy_scene.instantiate()
		var new_position = Vector2(randi_range(_offset, Screen_size.x - _offset),
				 randi_range(_offset, Screen_size.y - _offset))
		new_enemy.position = new_position
		new_enemy.setup(Enums.EntityTypes.ENEMY)
		add_child(new_enemy)
