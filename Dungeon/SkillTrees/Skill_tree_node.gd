extends Node2D


# holds the main skill of every "tree"
# e.t. only holds the CAST_BULLET skill but not its upgrades
var _skills = {}


func get_skill(skill : Enums.Abilities):
	return _skills[skill]


func _enter_tree():
	load_tree()


func load_tree():
	var level_1 = [DamageOverTimeEffect.new(DamageEffect.new(1), Enums.Effects.BLEED, 10)]
	var level_2 = [DamageEffect.new(2)]
	var level_3 = [DamageEffect.new(3)]
	var level_4 = [DamageEffect.new(4)]
	var effects = []
	var main_effect = SpawnEffectObject.new(Enums.ObjectTypes.BULLET)
	effects.append(level_1)
	effects.append(level_2)
	effects.append(level_3)
	effects.append(level_4)
	_skills[Enums.Abilities.CAST_BULLET] = Skill.new(Enums.Abilities.CAST_BULLET, 0, 3, main_effect, [], effects)
