extends RigidBody2D

@export var move_speed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	# Setup contact monitoring
	contact_monitor = true
	max_contacts_reported = 100
	
	# Setup the Rigidbody
	freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC
	set_lock_rotation_enabled(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Move Forward / Backward and Right / Left
	if Input.is_action_pressed("MoveForward"):
		move_and_collide(Vector2(move_speed, move_speed * 0.5) * -1.0)
	elif Input.is_action_pressed("MoveBackward"):
		move_and_collide(Vector2(move_speed, move_speed * 0.5))
		
	if Input.is_action_pressed("MoveRight"):
		move_and_collide(Vector2(-1.0 * move_speed, move_speed * 0.5) * -1.0)
	elif Input.is_action_pressed("MoveLeft"):
		move_and_collide(Vector2(-1.0 * move_speed, move_speed * 0.5))
	
	# If the interact action is pressed check for anything that 
	# can be interacted with.
	if Input.is_action_just_pressed("interact"):
			for body in get_colliding_bodies():
				# Interact with an NPC
				if body.is_in_group("npc"):
					body.player_interaction()
				# Interact with an Object
				elif body.is_in_group("interactable"):
					body.player_interaction()
