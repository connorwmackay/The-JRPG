extends Control
class_name QuestList

@export var quest_status: Label
@export var quest_description: Label

@export var quest_scroll_list: ItemScrollList

func update_quest_list():
	quest_scroll_list.clear_items()
	
	var is_first_quest = true
	for quest in $"/root/QuestSystem".quests:
		var quest_btn = quest_scroll_list.add_item(quest.quest_name)
		quest_btn.pressed.connect(self._quest_selected.bind(quest))
		
		if is_first_quest:
			quest_btn.button_pressed = true
			is_first_quest = false
			_quest_selected(quest)
		
func _quest_selected(quest):
	quest_description.text = quest.quest_description
	
	if quest.status == Quest.QuestStatus.Accepted:
		quest_status.text = "Active"
	elif quest.status == Quest.QuestStatus.Completed:
		quest_status.text = "Completed"
	elif quest.status == Quest.QuestStatus.Failed:
		quest_status.text = "Failed"
