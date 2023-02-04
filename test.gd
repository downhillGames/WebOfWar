func createNewGoal():
	var newGoalNode = newGoal.instance()
	newGoalNode.position = Vector2(get_viewport().get_mouse_position().x, get_viewport().get_mouse_position().y)
	self.add_child(newGoalNode)
	#newGoalBool = false
	newGoalNode.message = map_i
	newGoalNode.index = item_i
	newGoalNode.connect("clicked", self, "_on_item_clicked")
	goalDisplay.position = Vector2(original_positions[0], original_positions[1])
	itemsArray.append(newGoalNode)
	mapArray.append ( 1)
	mapArray.append (newGoalNode.position.x )
	mapArray.append (newGoalNode.position.y )
