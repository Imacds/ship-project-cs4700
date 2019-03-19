extends KinematicBody2D

export (int) var speed = 300
export (int) var vertical_offset = 100 # init offset

# Called when the node enters the scene tree for the first time.
func _ready():
	set_init_pos()
	
func set_init_pos():
	var size = OS.get_window_size()
	var ship_init_pos = Vector2(size.x / 2, size.y - vertical_offset)
	move_and_slide(ship_init_pos)

func _physics_process(delta):
	move(delta)
	
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
	move_and_collide(move_vec * speed * delta)