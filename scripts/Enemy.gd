extends Area2D

func _ready():
	pass
	
func _on_Enemy_area_entered(area):
	if  "Bullet" in area.get_name():
		area.queue_free()
		queue_free()
