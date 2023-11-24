extends Node

var _parent = null

func _ready():
	_parent = get_parent()


func apply_damage(_damage):
	
	var current_health = _parent._stats.get_full_stat(Enums.Stats.CURRENT_HEALTH)
	
	var health_loss = _damage/current_health[1]
	
	# death is handled by the game controller
	if current_health[0] - health_loss <= 0:
		Signals.entity_death.emit(_parent)
		_parent.queue_free()
	_parent._stats.modify_stat(Enums.Stats.CURRENT_HEALTH, -health_loss)
