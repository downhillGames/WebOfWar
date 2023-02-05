extends KinematicBody2D

const WALK_SPEED = 200

# Jump
export var jump_height := 2000.0
export var jump_duration := 0.3

#Physics
var velocity = Vector2()
var earth_gravity = 9.807 # m/s^2
export var gravity_scale := 100.0
var on_floor = false
var mass = .5
var impact_force = 500.0
var jump_timer = 0
var lives = 5
var global = preload("res://global.gd")
	
func _ready():
	add_to_group("knockable")



func _physics_process(delta):
	var viewport = get_viewport()
	var viewport_rect = viewport.get_visible_rect()

	if position.x < viewport_rect.position.x - 50:
		position.y = position.y - 300
		position.x = viewport_rect.position.x + viewport_rect.size.x
		
	if position.y > get_parent().get_node("Camera2D").position.y + viewport_rect.size.y:
		lives -= 1
		if lives == 4:
			get_parent().get_node("Control").get_node("Sprite10").visible = false
		if lives == 3:
			get_parent().get_node("Control").get_node("Sprite9").visible = false
		if lives == 2:
			get_parent().get_node("Control").get_node("Sprite8").visible = false
		if lives == 1:
			get_parent().get_node("Control").get_node("Sprite7").visible = false
		if lives == 0:
			global.winner = 1
			#get_parent().get_node("Control").get_node("Sprite6").visible = false
			get_tree().change_scene("res://Title2.tscn")
		position.y = get_parent().get_node("SPAWN").position.y
	# Movement logic
	if Input.is_action_pressed("punch1"):
		$AnimationPlayer.play("Slash")
		
	# Movement logic
	for i in range(get_slide_count()):
		var other = get_slide_collision(i).collider
		if Input.is_action_pressed("punch1"):
			if other.is_in_group("knockable"):
				# Calculate the force to apply based on the velocity and mass of this object
				var _force = impact_force * mass
				var _direction = (other.position - position).normalized()
				if self.position.x > other.position.x:
					other.move_and_slide(Vector2(-3000, 0))
				if self.position.x < other.position.x:
					other.move_and_slide(Vector2(3000, 0))
	if 1>0:
		if Input.is_action_pressed("ui_left"):
			velocity.x = -WALK_SPEED
			$AnimationPlayer.play("walk")
		elif Input.is_action_pressed("ui_right"):
			$AnimationPlayer.play("walk")
			velocity.x = WALK_SPEED
		else:
			velocity.x = 0
	# Jump logic
	jump(delta)

func jump(delta):
	if on_floor:
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = -jump_height
			jump_timer = jump_duration
		if Input.is_action_just_released("ui_accept") || jump_timer <= 0:
			jump_timer = 0
	if jump_timer > 0:
		jump_timer -= delta
		velocity.y = -jump_height * (jump_timer / jump_duration)
	velocity.y += earth_gravity * gravity_scale * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if is_on_floor():
		on_floor = true
	else:
		on_floor = false

# Create a Tween object and add it to the node you want to animate
