extends Node2D

enum {LEFT, RIGHT}

# Declare member variables here. Examples:
var side
var EnemyController
var bufferEnemy = []
var bufferCurve = []
var cooldown = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func init(var _side, var _EnemyController):
	side = _side
	EnemyController = _EnemyController
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cooldown += delta
	#Every fifth of a second, spawn from buffer
	if(cooldown >= 0.2):
		cooldown = 0
		if(not bufferEnemy.empty()):
			var enemy = bufferEnemy.pop_front()
			var curveChoice = bufferCurve.pop_front()
			
			#Exctract correct curve based on cardinality
			var curve
			if(side == LEFT):
				curve = curveChoice[0]
			else:
				curve = curveChoice[1]
				
			var curveInst = curve.instance()
			var enemyInst = enemy.instance()
			
			#Make sure EnemyController gets a record of this enemy
			EnemyController.recordEnemy(enemyInst)
			
			curveInst.get_child(0).add_child(enemyInst)
			add_child(curveInst)
			
			#print("Spawned an enemy")
	
	

func bufferEnemies(var enemies, var curves):
	for enemy in enemies:
		bufferEnemy.append(enemy)
	for curve in curves:
		bufferCurve.append(curve)