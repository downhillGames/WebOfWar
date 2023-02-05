extends Node2D
var speed = 0.5

func _process(delta):
	# Calculate the new position of the background sprite
	position.y += 30 * delta

	# If the sprite is off the bottom of the screen, move it back to the top
	if position.y > 1000:
		position.y += 1000

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
