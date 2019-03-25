extends Area2D

# Const and enum variable declarations:
var powerupType = 0;
var fallSpeed = Vector2(0,20)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var new_pos = fallSpeed * delta
	
	position.y += new_pos.y
	
func _on_Powerup_area_entered(area):
	queue_free()
	