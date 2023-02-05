extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var mouse_over_fight = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_mouse_entered():
	mouse_over_fight = true


func _on_Area2D_mouse_exited():
	mouse_over_fight = false


func _on_Area2D_input_event(viewport, event, shape_idx):
	if mouse_over_fight and event.is_pressed() and event.button_index == BUTTON_LEFT:
		get_tree().change_scene("res://MAin.tscn")
