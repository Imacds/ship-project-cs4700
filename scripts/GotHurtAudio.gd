extends Node

onready var sfx = [$Audio1, $Audio2, $Audio3, $Audio4, $Audio5, $Audio6, $Audio7, $Audio8, $Audio9, $Audio10, $Audio11]

func play():
	var index = randi() % sfx.size()
	sfx[index].play()