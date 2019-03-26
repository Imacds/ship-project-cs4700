extends MenuButton

func _pressed():
	global.score_required_to_unlock_boss = global.score_required_to_unlock_boss_default
	global.isNotGalagaClone = true
	get_tree().change_scene("res://Root.tscn")
