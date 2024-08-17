extends Node
class_name DialogueItem

# The properties
@export var speaker_name: String
@export var text: String

# TODO: Add support for optionally showing a choice during this dialogue

# Create an instance of this class
static func create(new_speaker_name: String, new_text: String) -> DialogueItem:
	var inst = DialogueItem.new()
	inst.speaker_name = new_speaker_name
	inst.text = new_text
	return inst
