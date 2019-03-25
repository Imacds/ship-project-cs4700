extends Node2D

onready var bullet_resource = preload("res://Bullet.tscn")

func _ready():
	$Timer.start()

func _on_Timer_timeout():
	var bullet = bullet_resource.instance()
	bullet.global_position = global_position
	bullet.get_node("Sprite").modulate = Color(255, 1, 1)
	get_parent().add_child(bullet)
