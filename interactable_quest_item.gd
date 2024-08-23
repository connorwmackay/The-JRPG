extends InteractableItem
class_name InteractableQuestItem

## The quest linked to this item
@export var quest: Quest = null

## The dialogue that plays when interacting if you have accepted the quest linked with this item
@export var interaction_quest_accepted_dialogue: String = ""

func player_interaction():
	if not allows_interaction:
		return
		
	if quest.status == Quest.QuestStatus.Accepted:
		get_tree().get_first_node_in_group("dialogue_box").queue_dialogue(
			DialogueItem.create("Hero", interaction_quest_accepted_dialogue)
		)
		quest.complete()
		$"/root/QuestSystem".notify_quest_update()
		add_item_to_inventory()
	elif quest.status == Quest.QuestStatus.NotAccepted:
		get_tree().get_first_node_in_group("dialogue_box").queue_dialogue(
			DialogueItem.create("Hero", interaction_dialogue)
		)
