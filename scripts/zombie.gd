extends Area2D
var hp = 200
var target
var dmg = 20
var eat = false
@onready var timer = $"Timer"
func _process(delta):
	if eat == true:
		pass
	else:
		global_position -= Vector2(0.4, 0)
	
func take_dmg(dmg):
	hp -= dmg
	if hp <= 0:
		queue_free()


func _on_area_entered(area):
	if area.is_in_group("plants"):
		eat = true
		target = area
		timer.start()
	


func _on_area_exited(area):
	if area.is_in_group("plants"):
		eat = false
		timer.stop()


func _on_timer_timeout():
	target.take_dmg(dmg)
