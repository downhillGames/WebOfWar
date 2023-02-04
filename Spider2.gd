extends KinematicBody2D

const WALK_SPEED = 200

# Jump
export var jump_height := 500.0
export var jump_duration := 0.2

# Physics
var velocity = Vector2()
var earth_gravity = 9.807 # m/s^2
export var gravity_scale := 100.0
var on_floor = false
var jump_timer = 0

func _ready():
	add_to_group("knockable")

func _process(delta):
	# Movement logic
	if 1>0:
		if Input.is_action_pressed("2p_left"):
			velocity.x = -WALK_SPEED
		elif Input.is_action_pressed("2p_right"):
			velocity.x = WALK_SPEED
		else:
			velocity.x = 0
	# Jump logic
	jump(delta)

func jump(delta):
	if on_floor:
		if Input.is_action_just_pressed("2p_accept"):
			velocity.y = -jump_height
			jump_timer = jump_duration
		if Input.is_action_just_released("2p_accept") || jump_timer <= 0:
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
