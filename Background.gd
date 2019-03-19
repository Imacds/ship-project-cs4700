extends ParallaxBackground

export (int) var scroll_speed = 10

func _ready():
	$ParallaxLayer.motion_mirroring = $ParallaxLayer/Sprite.texture.get_size().rotated($ParallaxLayer/Sprite.global_rotation)
	
func _process(delta):
	var scroll = Vector2(0,3) #Some default scrolling so there's always movement.
	scroll_offset += scroll * scroll_speed
	