class_name Skill

var _name
var _is_usable

var _current_level = 0
var _maximum_level = 3
var _effects = []
var _stats = []

var _upgrades = []


func setup(name, is_usable, current_level, maximum_level, effects = [], stats = [], upgrades = []):
	_name = name
	_is_usable = is_usable
	_current_level = current_level
	_maximum_level = maximum_level
	_effects = effects
	_stats = stats
	


func level_up():
	if _current_level < _maximum_level:
		_current_level += 1
