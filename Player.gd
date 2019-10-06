extends KinematicBody

export (float) var MoveSpeed = 200
export (float) var Gravity = -9.8

var velocity = Vector3(0, 0, 0)
var gravity = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	
#	if !is_on_floor():
#		gravity += Gravity * delta
#	else:
#		gravity = 0
	
	# get the input
	var h = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var v = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	velocity = Vector3(h, gravity, v) * MoveSpeed * delta
	
	velocity = move_and_slide(velocity, Vector3.DOWN)
	