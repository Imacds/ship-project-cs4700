extends VBoxContainer

func _ready():
	$PreviousScoreLabel.text = "Previous Score: " + str(global.previous_score)
	$HighscoreLabel.text = "High Score: " + str(global.get_highscore())