extends RigidBody2D

@export var npc_name: String = "npc"

# Called when the node enters the scene tree for the first time.
func _ready():
	# Setup contact monitoring
	contact_monitor = true
	max_contacts_reported = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Called when the player presses the "Interact" button/key
func player_interaction():
	print("The player interacted with " + npc_name)
