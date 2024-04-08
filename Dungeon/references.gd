extends Node

@warning_ignore("unused_private_class_variable")
@onready var _factory = get_node("/root/main/ObjectFactory")

#Components
var _health_component
var _ability_component
var _hitbox_component
var _movement_component
var _stats_component
var _effect_component

func _ready():
	_health_component = "HealthComponent"
	_ability_component = "AbilityComponent"
	_hitbox_component = "HitBoxComponent"
	_movement_component = "MovementComponent"
	_stats_component = "StatsComponent"
	_effect_component = "EffectComponent"
