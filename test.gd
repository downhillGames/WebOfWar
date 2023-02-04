extends Node2D
var newplatform = preload("res://Platform_test.tscn")



func _ready():
	var newplatformNode = newplatform.instance()
	newplatformNode.position = Vector2 (100,100)
	self.add_child(newplatformNode)

