extends Control
class_name UpgradeUI


@export var container : Node

var upgrade_card = preload("res://Core/UpgradeSystem/UpgradeCard.tscn")

func _ready():
	Signals.display_upgrades.connect(display_upgrades)
	Signals.upgrade_selected.connect(clear_upgrades)


func display_upgrades( upgrade_system : UpgradeSystem):
	clear_upgrades()
	var upgrades = upgrade_system._upgrades
	var player : Root = get_node(References.player_path)
	var player_stats : StatsComponent = player.get_component(Enums.ComponentTypes.STATS)
	for upgrade in upgrades:
		var card : UpgradeCard = upgrade_card.instantiate()
		card.set_data(upgrade, player_stats)
		container.add_child(card)


func clear_upgrades():
	for card in container.get_children():
		card.queue_free()
