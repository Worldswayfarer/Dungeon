extends Node2D
class_name Spawner

var _factory : ObjectFactory
var _screen_size : Vector2 = Vector2.ZERO
var _offset : float = 30

var _spawn_offset : float = _offset/2.0


func _ready():
	randomize()
	_screen_size = get_viewport_rect().size
	_factory = References.factory

func count_children() -> int:
	return get_child_count()

func cleanup():
	for child in get_children():
		child.queue_free()


func spawnEncounter(encounter : Encounter):
	for cluster : EncounterUnit in encounter.pattern:
		spawnCluster(cluster.type, cluster.count)


func spawnCluster(type : StringName, count : int = 1):
	
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
