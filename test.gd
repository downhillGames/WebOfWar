extends Node2D
var newplatform = preload("res://Platform_test.tscn")



func _ready():
	for n in range (1,10):
		newPlatform(randi() %500, randi() %1000)
	
func newPlatform(x, y):
	var newplatformNode = newplatform.instance()
	newplatformNode.position = Vector2 (x,y)
	self.add_child(newplatformNode)

	var object1 = get_node("Object1")
	var object2 = get_node("Object2")
	
	while object1.position.distance_to(object2.position) < 25
