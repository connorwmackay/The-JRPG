extends RigidBody2D
class_name NPCController

@export var npc_name: String = "npc"

# Should contain a list of nodes that have DialogueItems inside them
@export var npc_dialogue_trees: Array[Node]
@export var current_dialogue_tree_name = "base"

# Called when the node enters the scene tree for the first time.
func _ready():
	# Setup contact monitoring
	contact_monitor = true
	max_contacts_reported = 100

func find_dialogue_tree(dialogue_tree_name: String) -> DialogueTree:
	for dialogue_tree in npc_dialogue_trees:
		if dialogue_tree.tree_name == dialogue_tree_name:
			return dialogue_tree
	
	return null

# Called when the player presses the "Interact" button/key
func player_interaction():
		var dialogue_tree: DialogueTree = find_dialogue_tree(current_dialogue_tree_name)
		if dialogue_tree == null:
			return
			
		for child in dialogue_tree.get_children():
			if child is DialogueItem:
				get_tree().get_first_node_in_group("dialogue_box").queue_dialogue(child)
