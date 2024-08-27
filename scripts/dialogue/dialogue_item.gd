extends Node
class_name DialogueItem

# The properties

## The name of the character speaking
@export var speaker_name: String

## The text that will be spoken
@export var text: String

## Create an instance of this class
static func create(new_speaker_name: String, new_text: String) -> DialogueItem:
	var inst = DialogueItem.new()
	inst.speaker_name = new_speaker_name
	inst.text = new_text
	return inst
