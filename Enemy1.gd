extends Area2D

# Const and enum variable declarations:
enum STATE {RAIL, HOLDING, REQUEST_HOLDING}

# Member variable declarations:
var state = STATE.RAIL
var oldPos = get_transform().get_origin()
var teleport = false
var destroyed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_Enemy1_area_entered(area):
	if  "Bullet" in area.get_name():
		destroyed = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if state == STATE.RAIL:
		if get_parent().unit_offset < 0.95:
			get_parent().offset += delta * 400
		else:
			oldPos = get_global_transform().get_origin()
			teleport = get_parent().get_parent().teleportOnEnd
			state = STATE.REQUEST_HOLDING
			#print("Enemy ready for holding")
			
	elif state == STATE.REQUEST_HOLDING:
		pass
	elif state == STATE.HOLDING:
		pass
		
func tween(var target):
	var tween = get_node("Tween")
	tween.interpolate_property(self, "position", position, target, 3, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.start()
	
func destroy():
	if state == STATE.RAIL:
		get_parent().get_parent().queue_free()
	elif state == STATE.REQUEST_HOLDING:
		get_parent().get_parent().queue_free()
	elif state == STATE.HOLDING:
		queue_free()
