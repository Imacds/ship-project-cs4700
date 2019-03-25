extends Node

# Const and enum variable declarations:
enum {ATTACK, SPAWN} 

# Member variable declarations:
var enemies = []
var state = SPAWN
var counter = 0.0
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter += delta
	
	#Basic game rules: attack every 10 seconds, spawn every 10 seconds, with the two offset by 5 seconds.
	if counter > 5.0:
		if state == ATTACK:
			get_node("AttackController").attackRandom()
			state = SPAWN
			counter = 0.0
		elif state == SPAWN:
			get_node("SpawnController").spawnRandom()
			state = ATTACK
			counter = 0.0
		else:
			printerr("Illegal state reached in EnemyController")
			
	var destroy = []
	#Purge the list of all enemies that have been flagged to be deleted
	for enemy in enemies:
		if enemy.destroyed == true:
			enemy.destroy()
			destroy.append(enemy)
	for d in destroy:
		enemies.erase(d)
		score += 1
	
	#For all extant enemies, forward them to the accurate systems
	get_node("AttackController").attackList = []
	for enemy in enemies:
		if enemy.state == enemy.STATE.REQUEST_HOLDING:
			get_node("HoldingController").processHoldRequest(enemy)
		elif enemy.state == enemy.STATE.HOLDING:
			get_node("AttackController").attackList.append(enemy)
			
	
func recordEnemy(var enemy):
	enemies.append(enemy)
