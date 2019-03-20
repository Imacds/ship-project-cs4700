extends Node2D

const spotOrder = [3,2,4,1,5,0,6]

# Declare member variables here. Examples:
var freeIndex = 0
var row = 0
var time = 0.0
var newPos = Vector2(25,50)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	
	if(time >= 2.5):
		time = 0.0
		var tween = get_node("HoldingTween")
		tween.interpolate_property(self, "position", position, newPos, 2.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()	
		if(newPos == Vector2(25,50)):
			newPos = Vector2(50,50)
		else:
			newPos = Vector2(25,50)

func processHoldRequest(var enemy):
	#Separate the enemy from its rail
	var node1 = enemy.get_parent()
	node1.remove_child(enemy)
	#delete the rail, as it is no longer necessary
	node1.get_parent().queue_free()

	#Change the state
	enemy.state = enemy.STATE.HOLDING
	#Parent the enemy under the controller
	add_child(enemy)
	
	#Calculate the target offset of the enemy
	var targetOffset = Vector2(spotOrder[freeIndex] * 100, row * 100)
	
	freeIndex += 1
	if(freeIndex >= spotOrder.size()):
		row += 1
		freeIndex = 0
		if(row > 5):
			row = 0
			
	#Update the enemy's position so that it remains the same absolute position
	enemy.position = enemy.oldPos - position
	if enemy.teleport:
		enemy.position = Vector2(enemy.position.x, -100)
	enemy.tween(targetOffset)
	#print("Enemy moved to holding")