extends Area2D

export (int) var speed = 300
export (int) var vertical_offset = 100 # init offset
var screen_size
var ship_size
var bullets_container
var bullets_spawn
var bullet_resource
var lives = 3
var invulnerability = 2.0

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

func _on_Ship_area_entered(area):
	if  "Enemy1" in area.get_name():
		if invulnerability <= 0:
			lives -= 1
			if(lives > 0):
				queue_free()
			else:
			invulnerability = 2.0

	
func move(delta):
	if(invulnerability > 0):
		invulnerability -= delta
	
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
	if Input.is_action_just_pressed("shoot"):
		var bullet = bullet_resource.instance()
		bullet.global_position = bullets_spawn.global_position
		bullet.z_index = 5
		print(bullet.position)
		bullets_container.add_child(bullet)