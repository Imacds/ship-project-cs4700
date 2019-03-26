extends Label

func _process(delta):
	text = "HP: " + str(max(get_parent().hp, 0))
