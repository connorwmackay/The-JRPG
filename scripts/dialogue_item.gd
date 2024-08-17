extends Node
class_name DialogueItem

# The properties

## The name of the character speaking
@export var speaker_name: String

## The text that will be spoken
@export var text: String

## Will the player be making a choice during this dialogue?
@export var is_making_choice: bool = false

## The text for the top choice on the dialogue box (leave empty is you don't need a choice)
@export var top_choice_text: String = ""

## The text for the bottom choice on the dialogue box (leave empty is you don't need a choice)
@export var bottom_choice_text: String = ""

## The quest to accept if the top choice is selected by the player (Leave empty for no quest)
@export var quest_if_top_choice: Quest = null

## Create an instance of this class
static func create(new_speaker_name: String, new_text: String, new_is_making_choice: bool = false,
	new_top_choice_text: String = "", new_bottom_choice_text: String = "", new_quest_if_top_choice: Quest = null) -> DialogueItem:
	var inst = DialogueItem.new()
	inst.speaker_name = new_speaker_name
	inst.text = new_text
	inst.is_making_choice = new_is_making_choice
	inst.top_choice_text = new_top_choice_text
	inst.bottom_choice_text = new_bottom_choice_text
	inst.quest_if_top_choice = new_quest_if_top_choice
	return inst
