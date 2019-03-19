extends KinematicBody2D

export (int) var speed = 300
export (int) var vertical_offset = 100 # init offset
var screen_size
var ship_size

# Called when the node enters the scene tree for the first time.
func _ready():
	set_init_pos()
	var shape = $CollisionShape2D.shape
	ship_size = Vector2(shape.radius, shape.height)
	print(ship_size)
	
func set_init_pos():
	screen_size = OS.get_window_size()
	var ship_init_pos = Vector2(screen_size.x / 2, screen_size.y - vertical_offset)
	move_and_slide(ship_init_pos)

func _physics_process(delta):
	move(delta)
	shoot(delta)
	
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
	pass