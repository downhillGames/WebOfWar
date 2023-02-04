extends Node2D
var newplatform=preload("res://Platform_test.tscn")
func createNewGoal():
	var newplatformNode = newplatform.instance()
	newplatformNode.position = Vector2 (0,0)
	self.add_child(newplatformNode)
