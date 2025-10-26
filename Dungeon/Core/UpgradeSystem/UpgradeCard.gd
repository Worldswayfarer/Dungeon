extends Button
class_name UpgradeCard

var upgrade_data: Upgrade

func set_data( data : Upgrade):
	upgrade_data = data
	text = upgrade_data.ability_name



func _pressed():
	Signals.upgrade_selected.emit(upgrade_data)
