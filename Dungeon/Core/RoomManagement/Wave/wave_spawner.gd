extends Node2D
class_name Spawner

var _factory
var _screen_size = Vector2.ZERO
var _offset = 30

var _spawn_offset = _offset/2.0

static var _is_spawning : bool = true
static var _time_next_wave : float
static var _timer_max : float = 3


var _management : WaveManagement


func _ready():
	_screen_size = get_viewport_rect().size
	_factory = References.factory
	randomize()
	_time_next_wave = _timer_max
	_management = get_parent()


func _process(delta):
	_time_next_wave -= delta
	if !_is_spawning or _time_next_wave > 0:
		return
	for x in range(randi_range(1,3)):
		var wave : WaveUnit = get_next_cluster()
		spawnEnemies(wave.type, wave.count)


func get_next_cluster():
	var next = _management.next_spawn()
	_time_next_wave = _timer_max
	return next

static func stop_spawning():
	_is_spawning = false

static func start_spawning():
	_is_spawning = true
	_time_next_wave = _timer_max


func spawnEnemies(type : StringName, count : int = 1):
	
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
