extends Control
@onready var plant
func set_plant(plants):
	plant = plants

func mouse_entered():
	$"../../../../../../".plant = plant
	$"../../../../../../".plname = $".".name


func mouse_exited():
	pass
