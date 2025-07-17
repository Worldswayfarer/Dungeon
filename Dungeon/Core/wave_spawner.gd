extends Node2D


var _factory
var _screen_size = Vector2.ZERO
var _offset = 30
@warning_ignore("integer_division")
var _spawn_offset = _offset/2
var _time_next_wave
var _timer_max = 3
var _management


func _ready():
	_screen_size = get_viewport_rect().size
	_factory = References._factory
	randomize()
	_time_next_wave = _timer_max
	_management = get_parent()


func _process(delta):
	_time_next_wave -= delta
	if _time_next_wave <= 0:
		for x in range(randi_range(1,3)):
			var wave = get_next_cluster()
			spawnEnemies(wave[0], wave[1])


func get_next_cluster():
	var next = _management.determine_next_wave()
	_time_next_wave = _timer_max
	return next


func spawnEnemies(type : Enums.ObjectTypes, count : int = 1):
	
	var cluster_position = Vector2(
		randi_range(_offset, _screen_size.x - _offset),
		randi_range(_offset, _screen_size.y - _offset))
	for number in range(count):
		var new_enemy = _factory.get_object_instance(type)
		var new_position = Vector2(randf_range(-_spawn_offset, _spawn_offset),
				randf_range(-_spawn_offset, _spawn_offset))
		new_position += cluster_position
		
		new_enemy.position = new_position
		add_child(new_enemy)
