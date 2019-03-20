extends MenuButton

func _pressed():
	print("pressed")
	get_tree().change_scene("res://Root.tscn")
