extends Control
class_name UpgradeUI


@export var container : Node

var upgrade_card = preload("res://Core/UpgradeSystem/UpgradeCard.tscn")
var system : UpgradeSystem

func _ready():
	Signals.display_upgrades.connect(display_upgrades)
	Signals.upgrade_selected.connect(upgrade_selected)


func display_upgrades( upgrade_system : UpgradeSystem):
	clear_upgrades()
	system = upgrade_system
	var upgrades = system.get_upgrades()
	var player : Root = get_node(References.player_path)
	var player_stats : StatsComponent = player.get_component(Enums.ComponentTypes.STATS)
	for upgrade in upgrades:
		var card : UpgradeCard = upgrade_card.instantiate()
		card.set_data(upgrade, player_stats)
		container.add_child(card)


func upgrade_selected(upgrade : Upgrade):
	system.remove_upgrade(upgrade)
	clear_upgrades()

func clear_upgrades():
	for card in container.get_children():
		card.queue_free()
