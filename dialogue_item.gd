extends Node
class_name DialogueItem

# The properties
@export var speaker_name: String
@export var text: String
@export var is_making_choice: bool = false

# Leave blank for no choice
@export var top_choice_text: String = ""

# Leave blank for no choice
@export var bottom_choice_text: String = ""

# Create an instance of this class
# Create an instance of this class
static func create(new_speaker_name: String, new_text: String, new_is_making_choice: bool = false,
	new_top_choice_text: String = "", new_bottom_choice_text: String = "") -> DialogueItem:
	var inst = DialogueItem.new()
	inst.speaker_name = new_speaker_name
	inst.text = new_text
	inst.is_making_choice = new_is_making_choice
	inst.top_choice_text = new_top_choice_text
	inst.bottom_choice_text = new_bottom_choice_text
	return inst
