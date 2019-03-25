extends MenuButton

func _pressed():
	global.score_required_to_unlock_boss = 3.402823e+38
	get_tree().change_scene("res://Root.tscn")
