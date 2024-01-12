extends Node2D

var _parent = null

var _current_health : int = 10

var _max_health : int = 10
var _health_modifier : float = 1

var _armor : int = 1
var _armor_modifier : float = 1

func _ready():
	_parent = get_parent()


func apply_damage(damage):
	var combined_health = _current_health * _health_modifier
	var health_loss = damage / _health_modifier
	health_loss = health_loss / _armor * _armor_modifier
	
	if combined_health - health_loss <= 0:
		if _parent._type == Enums.EntityTypes.PLAYER:
			Signals.player_death.emit()
		else:
			_parent.queue_free()
	_current_health -= health_loss


func heal(amount):
	var combined_health = _current_health * _health_modifier
	var heal_amount = amount / _health_modifier
	
	_current_health += heal_amount
	if combined_health + heal_amount > _max_health * _health_modifier:
		_current_health = _max_health
