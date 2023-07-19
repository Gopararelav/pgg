extends Area2D
var hp = 100
@onready var peap = preload("res://objects/pea.tscn")
@onready var timer = $"Timer"
# Called every frame. 'delta' is the elapsed time since the previous frame.

func shoot():
	var pea = peap.instantiate()
	$"../../Bullets".add_child(pea)
	pea.global_position = $"Marker2D".global_position

func _ready():
	timer.wait_time = 2
	timer.start()
	timer.connect("timeout", shoot)
		
func take_dmg(dmg):
	hp -= dmg
	if hp <= 0:
		queue_free()
