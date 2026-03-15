extends Upgrade
class_name ProjectileUpgrade



func _init():
	text = "Projectiles + 1"

func do_upgrade(to_upgrade : StatsComponent):
	var projectiles = to_upgrade.get_stat(STATS.PROJECTILES)
	to_upgrade.change_stat(STATS.PROJECTILES, projectiles + 1)