extends Node2D


var _factory
var _screen_size = Vector2.ZERO
var _offset = 20


func _ready():
	_screen_size = get_viewport_rect().size
	_factory = get_node("/root/main/ObjectFactory")
	randomize()


func spawnEnemies(type : Enums.ObjectTypes, count : int = 1):
	
	for number in range(count):
		var new_enemy = _factory.get_object_instance(type)
		var new_position = Vector2(
				randi_range(_offset, _screen_size.x - _offset),
				randi_range(_offset, _screen_size.y - _offset))
		new_enemy.position = new_position
		new_enemy.setup(Enums.EntityTypes.ENEMY)
		add_child(new_enemy)


func _on_timer_timeout():
	spawnEnemies(Enums.ObjectTypes.BASE, 10)
