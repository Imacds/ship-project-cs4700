extends Area2D

class SpawnSorter:
    static func sort(a, b):
        return a.position.y > b.position.y

export (int) var hp = 90 # player can do roughly 3 dmg / sec; multi-hits are common tho
# fireball #
onready var spawnpoints = [$FireballSpawnPoint, $FireballSpawnPoint2, $FireballSpawnPoint3, $FireballSpawnPoint4, $FireballSpawnPoint5]
var last_fired = 0
export (int) var time_between_shots = 1.25
onready var fireball_resource = preload("res://scenes/Fireball.tscn")
onready var explosion_resource = preload("res://scenes/Explosion.tscn")
onready var fireball_container = $"../../FireballContainer"

onready var thing = $"../../EnemyController"

var death_timer = 10.0

func _ready():
    z_index = 1

func _on_StarBoss_area_entered(area):
    if "Bullet" in area.get_name():
        hp -= 1 + int(area.charged)
        if hp > 0:
        	$GotHurtAudio.play()
        if hp <= 0 and death_timer == 10.0:
            explode()

func _process(delta):
	if hp > 0:
		shoot(delta)
	else:
		death_timer -= delta
	
	if death_timer <= 0:
		die()
		

func shoot(delta):
    last_fired += delta
    
    if last_fired >= time_between_shots:
        last_fired = 0
        create_fireballs()

func create_fireballs():
    $FireballsFiredAudio.play()
    
    # select the 3 lowest spawn points (highest y values)
    spawnpoints.sort_custom(SpawnSorter, "sort")
    
    # instantiate fireballs at those points
    for i in range(3):
        var fireball = fireball_resource.instance()
        fireball.global_position = spawnpoints[i].global_position
        $FireballContainer.add_child(fireball)
        #fireball_container.add_child(fireball)
        
func die():
    global.change_scene("main menu", thing.score)
	
func explode():
	thing.score += 100000
	for point in spawnpoints:
		var explosion = explosion_resource.instance()
		explosion.global_position = point.global_position
		$FireballContainer.add_child(explosion)