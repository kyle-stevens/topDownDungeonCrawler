extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vel : Vector3
var move : Vector3
var speed : int
# Called when the node enters the scene tree for the first time.
func _ready():
	vel = Vector3()
	move = Vector3()
	speed = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move = Vector3.ZERO
	vel = Vector3.ZERO
	#Adjust for acceleration
	if Input.is_action_pressed("move_up"):
		move.x = 1
	if Input.is_action_pressed("move_down"):
		move.x = -1
	if Input.is_action_pressed("move_left"):
		move.z = -1
	if Input.is_action_pressed("move_right"):
		move.z = 1
		
	move.y = -1
	vel = move_and_slide(move * speed)
