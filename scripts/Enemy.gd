extends Area2D

func _ready():
	pass
	
func _on_Enemy_area_entered(area):
	print('enter')
	if area.get_name() == "Bullet":
		area.queue_free()
		queue_free()
