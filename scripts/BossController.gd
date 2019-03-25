extends Node

onready var boss_resource = preload("res://scenes/StarBoss.tscn")

func spawn():
	$"../AudioStreamPlayer2D".stop()
	var boss = boss_resource.instance()
	add_child(boss)