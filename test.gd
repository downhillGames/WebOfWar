extends Node2D
var newplatform = preload("res://Platform_test.tscn")



func _ready():
	for n in range (1,10):
		newPlatform(n * 100, n * 100)
	
func newPlatform(x, y):
	var newplatformNode = newplatform.instance()
	newplatformNode.position = Vector2 (x,y)
	newplatformNode.position = Vector2 (25,100)
	self.add_child(newplatformNode)

var rand= randi () %1000
