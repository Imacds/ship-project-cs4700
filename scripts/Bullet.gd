extends Area2D

export (int) var speed = 600
export var charged = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)

func move(delta):
	var movement = Vector2()
	movement.y -= 1
	translate(movement * speed * delta)
	
	if(position.y < -10):
		queue_free()


func _on_Bullet_area_entered(area):
	if  "Enemy1" in area.get_name() and not charged:
		queue_free()