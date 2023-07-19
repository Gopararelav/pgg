extends Node2D

@onready var plant
@onready var plname
func _ready():
	$CanvasLayer/Control.visible = true
func create(gplant, pos):
	var planted = gplant.instantiate()
	planted.global_position = pos
	$"Plants".add_child(planted)
	planted.name = plname
	planted.z_index = (pos.y/128+3)
	plant = false
func  _input(event):
	if plant:
		if event is InputEventMouseButton:
			if Input.is_mouse_button_pressed(1):
				var pos = round(get_global_mouse_position()/128)*128
				var cr = true
				if pos.x >= -512 and pos.x <= 512 and pos.y >= -265 and pos.y <= 256:
					if $"Plants".get_children():
						for x in $"Plants".get_children():
							if x.get_global_position()/128 == pos/128:
								cr = false
								break
						if cr:
							create(plant, pos)
							cr = true
					else:
						create(plant, pos)
