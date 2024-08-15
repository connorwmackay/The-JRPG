extends RigidBody2D

@export var move_speed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC
	set_lock_rotation_enabled(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("MoveForward"):
		move_and_collide(Vector2(move_speed, move_speed * 0.5) * -1.0)
	elif Input.is_action_pressed("MoveBackward"):
		move_and_collide(Vector2(move_speed, move_speed * 0.5))
		
	if Input.is_action_pressed("MoveRight"):
		move_and_collide(Vector2(-1.0 * move_speed, move_speed * 0.5) * -1.0)
	elif Input.is_action_pressed("MoveLeft"):
		move_and_collide(Vector2(-1.0 * move_speed, move_speed * 0.5))