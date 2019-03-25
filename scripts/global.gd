extends Node

# project globals #
var score_required_to_unlock_boss = 500
var previous_score = 0
var scores = []
var highscore = get_highscore()

func get_highscore():
	var highest = 0
	for score in scores:
		if score > highest:
			highest = score
	
	highscore = highest
	return highscore