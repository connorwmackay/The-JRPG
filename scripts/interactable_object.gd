extends RigidBody2D



@export var object_name: String = "Object"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Setup contact monitoring
	contact_monitor = true
	max_contacts_reported = 100
	
	# Setup the Rigidbody
	freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC
	set_lock_rotation_enabled(true)


func player_interaction():
	get_tree().get_first_node_in_group("dialogue_box").queue_dialogue(DialogueItem.create("Hero", "Found a " + object_name + "!"))
