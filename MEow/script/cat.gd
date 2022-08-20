extends KinematicBody2D

export var catspeed = 30
export var gravity = 10
export var jumpp = -100
export var isfloor = Vector2(0,-1)

var velocity : Vector2
var onground = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_on_floor():
		onground = true
	else:
		onground = false
	if Input.is_action_pressed("ui_left"):
		velocity.x = -catspeed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = catspeed
	else:
		velocity.x = 0
	if Input.is_action_just_pressed("ui_up"):
		if onground == true:
			velocity.y = jumpp
			onground = false
	if Input.is_action_just_pressed("meow"):
		$meow.play()
	velocity.y += gravity
	velocity = move_and_slide(velocity, isfloor)
	pass
