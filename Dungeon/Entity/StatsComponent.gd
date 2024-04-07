extends Node2D

class_name StatsComponent

var _stats = {}


func _init():
	_stats[Enums.Stats.DAMAGE] = 10
	_stats[Enums.Stats.DAMAGEMULTIPLIER] = 1

