extends Node2D
var newplatform1 = preload("res://platform1.tscn")
var newplatform2 =preload("res://platform2.tscn")
var newplatform3 = preload("res://platform3.tscn")
var newplatform4 = preload("res://platform4.tscn")
var newplatform5 = preload("res://platform5.tscn")
var newplatform6 = preload("res://platform6.tscn")
var newplatform7 = preload("res://platform7.tscn")
var newplatform8 = preload("res://platform8.tscn")
var newplatform9 = preload("res://platform9.tscn")
var newplatform10 = preload("res://platform10.tscn")

var speed = 75
var height = 500


var devmode = false

#Platfrom array generation and rerandomization

var object_array = []

func _ready():
	randomize()
	
	
	var object
	var rand = randi() % 6
	for i in range(200):
		height = height - rand_range(100, 200)
		if  i%2==0:

			if rand== 1:
				object = newplatform2.instance()
			elif rand== 2:
				object = newplatform4.instance()
			elif rand== 3:
				object = newplatform6.instance()
			elif rand== 4:
				object = newplatform8.instance()
			elif rand== 5:
				object = newplatform10.instance()
				
		elif  i%2==1:
				
			if rand== 1:
				object = newplatform1.instance()
			elif rand== 2:
				object = newplatform3.instance()
			elif rand== 3:
				object = newplatform5.instance()
			elif rand== 4:
				object = newplatform6.instance()
			elif rand== 5:
				object = newplatform9.instance()


		$Panels.add_child(object)
		object_array.append(object)
		height = height + rand_range(100, 200)
		height = height - rand_range(100, 200)
		object.position = Vector2(rand_range(100, 200), height)
		
	while check_distance():
		randomize_positions()



func _process(delta):
	if devmode:
		pass
	else:
		$Camera2D.position.y -= speed * delta
		$SPAWN.position.y -= speed * delta
		$Control.position.y -= speed * delta

func check_distance():
	for i in range(len(object_array)):
		for j in range(i+1, len(object_array)):
			if object_array[i].position.distance_to(object_array[j].position) < 30:
				return true
	return false

func randomize_positions():
	for object in object_array:
		object.position = Vector2(rand_range(0, 500), height)
