extends Button

func _on_ExitButton_pressed():
	exit()
	
func exit():
	get_tree().change_scene("res://MainMenu.tscn")
