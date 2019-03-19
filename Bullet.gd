extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var MOVE_SPEED = 600

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)

func move(delta):
	var movement = Vector2()
	movement.y -= 1
	move_and_collide(movement * MOVE_SPEED * delta)
