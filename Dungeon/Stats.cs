using Godot;
using System;

public partial class Stats : Node
{
	var Stat_Sheet : Dictionary<Enums.Stats, float> = {
		Enums.Stats.CURRENT_HEALTH : 1,
		Enums.Stats.MAX_HEALTH : 1,
		Enums.Stats.SPEED : 1,
		Enums.Stats.DAMAGE : 1,
		Enums.Stats.ARMOR : 1
	}
}
