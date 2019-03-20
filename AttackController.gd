extends Node

# Const and enum variable declarations:
const Curve_Dive = preload("res://Curve-Dive.tscn")

# Member variable declarations:
var attackList = [] #populated by EnemyController

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func attackRandom():
	if(not attackList.empty()):
		for j in range(0,round(attackList.size()/2)):
			#Select a random attacker
			var i = randi() % attackList.size()
			var enemy = attackList[i]
			
			#Get
			var currentPos = enemy.get_global_transform().get_origin()
			enemy.get_parent().remove_child(enemy)
			var curveInst = Curve_Dive.instance()
			curveInst.get_child(0).add_child(enemy)
			enemy.position = Vector2(0,0)
			add_child(curveInst)
			
			curveInst.position = currentPos
			enemy.state = enemy.STATE.RAIL
			
			#print("A random attacks ")