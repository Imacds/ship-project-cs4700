extends Node2D

export (bool) var game_paused = false

func set_paused(now_paused):
	game_paused = now_paused
	get_tree().paused = game_paused
