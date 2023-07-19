extends Area2D
var dmg = 20

func _process(delta):
	global_position += Vector2(8, 0)


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	if area.is_in_group("zombies"):
		area.take_dmg(dmg)
		queue_free()
