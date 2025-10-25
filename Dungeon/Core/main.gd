extends Node2D


var _factory : ObjectFactory
var _upgrade_system : UpgradeSystem

func _ready():
	_factory = References.factory

	_upgrade_system = UpgradeSystem.new()
	add_child(_upgrade_system)

	StatLoader.read_stats()

	_factory.add_child(_factory.get_object_instance(IDS.PLAYER))

	
	Signals.player_death.connect(end_game)
	Signals.restart_game.connect(restart_game)


func end_game():
	Signals.pause_game.emit()


func restart_game():
	_factory.cleanup()
	var new_player = _factory.get_object_instance(IDS.PLAYER)
	_factory.add_child(new_player)
	Signals.pause_game.emit()
