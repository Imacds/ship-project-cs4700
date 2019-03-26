extends Node

# project globals #

# score #
var isNotGalagaClone = true

var score_required_to_unlock_boss = 500000
var score_required_to_unlock_boss_default = 500000
var previous_score = 0
var scores = []
var highscore = 0
# scene #
var scenes = {"main menu": "res://MainMenu.tscn", "game": "res://Root.tscn"} 

func get_highscore():
	var highest = 0
	for score in scores:
		if score > highest:
			highest = score
	
	highscore = highest
	return highscore

func change_scene(scene, current_score = false):
	""":param current_score: type is float"""
	get_tree().paused = false
	
	if current_score:
		global.scores.append(current_score)
		global.previous_score = current_score
		
	var resource_location = scenes[scene]
	get_tree().change_scene(resource_location)