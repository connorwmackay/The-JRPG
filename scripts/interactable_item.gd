extends RigidBody2D
class_name InteractableItem

@export var item_name: String = ""
@export var item_description: String = ""

@export var interaction_dialogue: String = ""

var allows_interaction: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Setup contact monitoring
	contact_monitor = true
	max_contacts_reported = 100
	allows_interaction = true
	visible = true
	
	# Setup the Rigidbody
	freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC
	set_lock_rotation_enabled(true)

func add_item_to_inventory():
	$"/root/InventorySystem".inventory.append(self)
	allows_interaction = false
	visible = false

func player_interaction():
	if not allows_interaction:
		return
	
	get_tree().get_first_node_in_group("dialogue_box").queue_dialogue(
		DialogueItem.create("Hero", interaction_dialogue)
	)
	add_item_to_inventory()
