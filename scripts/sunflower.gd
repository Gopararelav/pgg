extends Area2D
var hp = 100

func take_dmg(dmg):
	hp -= dmg
	if hp <= 0:
		queue_free()
