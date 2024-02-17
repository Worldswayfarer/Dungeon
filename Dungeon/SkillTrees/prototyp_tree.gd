class_name SkillTree


# holds the main skill of every "tree"
# e.t. only holds the CAST_BULLET skill but not its upgrades
var _skills = {}


func _init(skills):
	_skills = skills


func get_skill_effects(name):
	return _skills[name].get_effects
