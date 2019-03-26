extends Sprite

var life = 0.0

func _ready():
	$AnimationPlayer.play("ExplosionAnim")
	$AudioStreamPlayer2D.play(0.0)

func _process(delta):
	life += delta
	if life >= 5.0:
		queue_free()