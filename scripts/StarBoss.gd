extends Area2D

export (int) var hp = 90 # player can do roughly 3 dmg / sec

func _ready():
	z_index = 1

func _on_StarBoss_area_entered(area):
	if "Bullet" in area.get_name():
		hp -= 1 + int(area.charged)
		print(hp)
