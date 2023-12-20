extends Node2D


var _factory


var Screen_size = Vector2.ZERO
var _offset = 20


func _ready():
	Screen_size = get_viewport_rect().size
	_factory = get_node("/root/main/ObjectFactory")
	print(Screen_size)
	randomize()
	spawnEnemies()


func spawnEnemies(count = 10):
	
	for number in range(count):
		var new_enemy = _factory.get_object_instance(Enums.ObjectTypes.BASE)
		var new_position = Vector2(
				randi_range(_offset, Screen_size.x - _offset),
				randi_range(_offset, Screen_size.y - _offset))
		new_enemy.position = new_position
		new_enemy.setup(Enums.EntityTypes.ENEMY)
		add_child(new_enemy)
