extends RigidBody2D

@export var npc_name: String = "npc"
@export var npc_dialogue: Array[Dictionary] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	# Setup contact monitoring
	contact_monitor = true
	max_contacts_reported = 100

# Called when the player presses the "Interact" button/key
func player_interaction():
	for dialogue in npc_dialogue:
		get_tree().get_first_node_in_group("dialogue_box").queue_dialogue(dialogue["name"], dialogue["text"])
