extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(get_parent().get_parent().get_parent().get_parent().has_node("Ship")):
		text = "Lives: " + str(get_parent().get_parent().get_parent().get_parent().get_node("Ship").lives)
	else:
		text = "Lives: 0"
