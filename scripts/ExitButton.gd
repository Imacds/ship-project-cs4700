extends Button

onready var enemy_controller = $"../../../EnemyController"

func _on_ExitButton_pressed():
	exit()
	
func exit():
	global.change_scene("main menu", enemy_controller.score)
