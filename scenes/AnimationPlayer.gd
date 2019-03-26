extends AnimationPlayer

func _ready():
	playback_speed = 1
	play("ExplosionAnim")

func _on_AnimationPlayer_animation_finished(anim_name):
	get_parent().frame = 0