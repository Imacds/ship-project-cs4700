extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Score Required to \nReach Boss in Adventure Mode: " + str(get_score_required())

func get_score_required():
	return global.score_required_to_unlock_boss_default
