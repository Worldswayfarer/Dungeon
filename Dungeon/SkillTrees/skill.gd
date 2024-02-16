class_name Skill

var _name

var _current_level = 0
var _maximum_level = 3

# 2-dimensional array, every level is seperate
var _effects = []

var _upgrades = []


func Skill(name, current_level, maximum_level, effects = [], upgrades = []):
	_name = name
	_current_level = current_level
	_maximum_level = maximum_level
	_effects = effects


func level_up():
	if _current_level < _maximum_level:
		_current_level += 1


func get_effects():
	return _effects[_current_level]
