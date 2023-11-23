extends Node

var _parent = null

func _ready():
	_parent = get_parent()


func apply_damage(target : EntityStats, _damage):
	
	var armor = _parent._stats.getStat(Enums.Stats.ARMOR)
	var current_health = _parent._stats.getStat(Enums.Stats.CURRENT_HEALTH)
	
	var health_loss = current_health[1] * _damage
	
	# death is handled by the game controller
	if current_health[0] - health_loss <= 0:
		Signals.entity_death.emit(_parent)
	_parent._stats.modify_stat(Enums.Stats.CURRENT_HEALTH, -health_loss)
