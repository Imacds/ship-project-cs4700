extends Node

# Const and enum variable declarations:
const Enemy1 = preload("res://Enemy1.tscn")
const Curve1 = [preload("res://Curve-Smooth-Left.tscn"), preload("res://Curve-Smooth-Right.tscn")]

# Member variable declarations:
var spawnSpotsLeft = []
var spawnSpotsRight = []

var spotCounter = 0
var sideCounter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	spawnSpotsLeft = [get_node("SpawnSpotL1"), get_node("SpawnSpotL2"), get_node("SpawnSpotL3"), get_node("SpawnSpotL4")]
	spawnSpotsRight = [get_node("SpawnSpotR1"), get_node("SpawnSpotR2"), get_node("SpawnSpotR3"), get_node("SpawnSpotR4")]
		
	#Make sure to init all of the SpawnSpots
	for spot in spawnSpotsLeft:
		spot.init(spot.LEFT, get_parent())

	for spot in spawnSpotsRight:
		spot.init(spot.RIGHT, get_parent())

func spawnRandom():
	#Chose a spawn spot to spawn from
	var spot
	if(sideCounter == 0):
		spot = spawnSpotsLeft[spotCounter]
	else:
		spot = spawnSpotsRight[spotCounter]
	
	#Tell it to spawn 5 enemies
	spot.bufferEnemies([Enemy1, Enemy1, Enemy1, Enemy1, Enemy1],[Curve1,Curve1,Curve1,Curve1,Curve1])
	#spot.bufferEnemies([Enemy1],[Curve1])
	
	#Iterate the spot for testing purposes
	spotCounter += 1
	if(spotCounter >= 4):
		spotCounter = 0
		if(sideCounter == 0):
			sideCounter = 1
		else:
			sideCounter = 0	
			
		