extends RigidBody2D
class_name InteractableItem


@export var object_name: String = "Object"

## Should picking this object up complete a quest?
@export var picking_up_completes_quest: bool = false

## This should be empty unless picking_up_completes_quest is true
@export var quest: Quest = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Setup contact monitoring
	contact_monitor = true
	max_contacts_reported = 100
	
	# Setup the Rigidbody
	freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC
	set_lock_rotation_enabled(true)


func player_interaction():
	if picking_up_completes_quest:
		if quest.status == Quest.QuestStatus.Accepted:
			get_tree().get_first_node_in_group("dialogue_box").queue_dialogue(
				DialogueItem.create("", "Picked up " + object_name + "!")
			)
			quest.complete()
			queue_free()
		elif quest.status == Quest.QuestStatus.NotAccepted:
			get_tree().get_first_node_in_group("dialogue_box").queue_dialogue(
				DialogueItem.create("Hero", "Found " + object_name + ", I don't know what to do with this yet.")
			)
	else:
		get_tree().get_first_node_in_group("dialogue_box").queue_dialogue(
			DialogueItem.create("", "Picked up " + object_name + "!")
		)
		queue_free()
