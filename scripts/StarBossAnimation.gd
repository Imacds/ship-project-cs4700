extends AnimationPlayer

func _ready():
	playback_speed = 0.1
	play("idle")

func _on_AnimationPlayer_animation_finished(anim_name):
	play(anim_name)
