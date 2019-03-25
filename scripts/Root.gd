extends Node2D

export (bool) var game_paused = false

func _ready():
	print(global.score_required_to_unlock_boss)

func set_paused(now_paused):
	game_paused = now_paused
	get_tree().paused = game_paused
