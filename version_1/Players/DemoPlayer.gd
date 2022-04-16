extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vel : Vector3
var move : Vector3
var speed : int
var target_location : Vector3
# Called when the node enters the scene tree for the first time.
func _ready():
	vel = Vector3()
	move = Vector3()
	speed = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	#move = Vector3.ZERO
#	#vel = Vector3.ZERO
#	#Adjust for acceleration
#	if Input.is_action_pressed("move_up"):
#		move.x = 1
#	if Input.is_action_pressed("move_down"):
#		move.x = -1
#	if Input.is_action_pressed("move_left"):
#		move.z = -1
#	if Input.is_action_pressed("move_right"):
#		move.z = 1
#
#	move.y = -1
#	vel = move_and_slide(move * speed)
	move.y = -1 #gravity
	vel = move_and_slide(move * speed)
	
	if (target_location - self.global_transform.origin) > Vector3(0.25,0,0.25):
		vel = move_and_slide(target_location - self.global_transform.origin.normalized())
	
	
func _input(event):
	var ray_length = 100
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		var camera = $Camera
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * ray_length
		var cursorPos = Plane(Vector3.UP, 0).intersects_ray(from, to)
		print(cursorPos)
		
		cursorPos = Vector3(cursorPos.x, 0, cursorPos.z)
		target_location = cursorPos
		#vel = move_and_slide(self.global_transform.origin + cursorPos)
