extends BaseComponent

class_name MovementComponent

var _direction : Vector2 = Vector2.ZERO

var _Stats : StatsComponent

func get_component_type() -> Enums.ComponentTypes:
	return Enums.ComponentTypes.MOVEMENT

func _ready():
	_Stats = get_component(Enums.ComponentTypes.STATS)

func _physics_process(delta):
	if _Stats:
		var speed = _Stats.get_stat(Enums.Stats.SPEED)
		_parent.position += _direction * speed * delta
