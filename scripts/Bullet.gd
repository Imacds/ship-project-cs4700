extends Area2D

export (int) var speed = 600

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)

func move(delta):
	var movement = Vector2()
	movement.y -= 1
	translate(movement)
