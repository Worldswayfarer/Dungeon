extends Control
class_name UpgradeUI


@export var container : Node

var upgrade_card = preload("res://Core/UpgradeSystem/UpgradeCard.tscn")

func ready():
	Signals


func display_upgrades( upgrades : Array[Upgrade]):
	clear_upgrades()
	for upgrade in upgrades:
		var card : UpgradeCard = upgrade_card.instantiate()
		card.set_data(upgrade)
		container.add_child(card)


func clear_upgrades():
	for card in container.get_children():
		card.queue_free()
