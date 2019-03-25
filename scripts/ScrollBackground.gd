extends ParallaxBackground
# Declare member variables here. Examples:
export (Vector2) var scrollSpeed = Vector2(2,2)
var pos = Vector2(0,0)
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	pos = Vector2(pos.x + scrollSpeed.x*delta,pos.y + scrollSpeed.y*delta)
	scroll_offset.y = pos.y
	#scroll_offset = pos
	#print("HOLY SHIT")
	#print(pos.x)
	#print(pos.y)
	

