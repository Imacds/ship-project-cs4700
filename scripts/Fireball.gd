extends Area2D

export (int) var speed = 900
export (Vector2) var direction = Vector2(0, 1)

func _physics_process(delta):
	position += direction * speed * delta