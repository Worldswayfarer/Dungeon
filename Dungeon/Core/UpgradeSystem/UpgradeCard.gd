extends Button
class_name UpgradeCard

var _upgrade_data: Upgrade
var _user : StatsComponent

func set_data( data : Upgrade, user : StatsComponent):
	_upgrade_data = data
	text = _upgrade_data.text
	_user = user



func _pressed():
	_upgrade_data.do_upgrade(_user)
	Signals.upgrade_selected.emit(_upgrade_data)
