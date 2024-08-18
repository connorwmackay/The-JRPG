extends DialogueItem
class_name DialogueCompleteQuest

@export var quest: Quest = null

## Create an instance of this class
static func create(new_speaker_name: String, new_text: String, new_quest: Quest = null) -> DialogueCompleteQuest:
	var inst = DialogueItem.new()
	inst.speaker_name = new_speaker_name
	inst.text = new_text
	inst.quest = new_quest
	return inst
