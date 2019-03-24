extends KinematicBody2D

var screen_size

# ship #
export (int) var speed = 300
export (int) var vertical_offset = 100 # init offset
var ship_size
export (int) var init_lives = 3
var lives = init_lives
var invulnerability = 1.0
export (float) var invulnerability_time = 2.0
# shooting #
var charge_counter = 0.0 # duration that the fire button has been held
var fire_cooldown = 0.0 # time since last fired
export (float) var time_til_charged = 0.75
export (float) var time_between_shots = 0.35
var charged_audio_played = false
# bullet #
var bullets_container
var bullets_spawn
var bullet_resource
# ref other objs #
onready var retry_menu = get_parent().get_node("GUI/RetryMenu")
onready var scene_root = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_init_pos()
	var shape = $CollisionShape2D.shape
	ship_size = Vector2(shape.radius, shape.height)
	
	bullets_container = get_parent().get_node("BulletsContainer")
	bullets_spawn = get_node("BulletsSpawn")
	bullet_resource = preload("../Bullet.tscn")
	
func set_init_pos():
	screen_size = OS.get_window_size()
	var ship_init_pos = Vector2(
		screen_size.x / 2, 
		screen_size.y - vertical_offset)

	position = ship_init_pos

func _physics_process(delta):
	move(delta)
	shoot(delta)
	update_ship_colors(delta)
	
func update_ship_colors(delta):
	if invulnerability > 0.0:
		invulnerability -= delta
		get_node("Sprite").modulate = Color(255, 255, 255)
	elif charge_counter >= time_til_charged:
		$Sprite.modulate = Color.red
	elif charge_counter >= 0.1:
		$Sprite.modulate = $Sprite.modulate.linear_interpolate(Color.orangered, delta) 
	else:
		get_node("Sprite").modulate = Color(1, 1, 1)
	
func move(delta):
	var move_vec = Vector2()
	if Input.is_action_pressed("move_down"):
		move_vec.y += 1
	if Input.is_action_pressed("move_up"):
		move_vec.y -= 1
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
		
	move_vec = move_vec.normalized()
	var new_pos = move_vec * speed * delta
	
	move_and_collide(new_pos)
	position.x = clamp(position.x, 0 + ship_size.x, screen_size.x - ship_size.x)
	position.y = clamp(position.y, 0 + ship_size.y, screen_size.y - ship_size.y)
	
func shoot(delta):
	if fire_cooldown > 0.0:
		fire_cooldown -= delta
	
	if Input.is_action_just_pressed("shoot") and fire_cooldown <= 0:
		create_bullet()
		fire_cooldown = time_between_shots
		charge_counter = 0.0
		
	elif Input.is_action_pressed("shoot"):
		charge_counter += delta
		if charge_counter >= time_til_charged and not charged_audio_played:
			charged_audio_played = true
			$ShipIsChargedAudio.play()

	elif Input.is_action_just_released("shoot") and charge_counter >= time_til_charged:
		create_bullet(true)
		fire_cooldown = 0.0
		charge_counter = 0.0
		charged_audio_played = false

func create_bullet(charged = false):
	# create the instance of the bullet & change its pos
	var bullet = bullet_resource.instance()
	bullet.global_position = bullets_spawn.global_position
	bullets_container.add_child(bullet)
	
	$ChargedShotFiredAudio.play() if charged else $ShotFiredAudio.play() # play audio
	
	bullet.charged = charged
	if charged: # change color and speed if charged
		bullet.get_node("Sprite").modulate = Color(255, 1, 1)
		bullet.speed = 800
	return bullet

func _on_Ship_area_entered(area):
	if "Enemy1" in area.get_name():
		die(area)

func die(killer):
	if invulnerability <= 0.0:
		lives -= 1
		if lives <= 0:
			present_retry_menu()
		else:
			invulnerability = invulnerability_time
			
func present_retry_menu():
	retry_menu.start_countdown()
	scene_root.set_paused(true)
