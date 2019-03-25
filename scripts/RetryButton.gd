extends Button

onready var ship = $"/root/Root/Ship"
onready var scene_root = $"/root/Root"
onready var timer = $"../CountdownLabel"

func _on_RetryButton_pressed():
	ship.lives = ship.init_lives
	scene_root.set_paused(false)
	get_parent().hide()
	timer.stop_countdown()