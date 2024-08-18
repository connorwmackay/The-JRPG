extends VBoxContainer
class_name QuestList

@export var btn_group: ButtonGroup
@export var quest_status: Label
@export var quest_description: Label

func update_quest_list():
	for node in get_children():
		node.queue_free()
	
	var is_first_quest = true
	for quest in $"/root/QuestSystem".quests:
		# Quest Name
		var quest_name_button: Button = Button.new()
		quest_name_button.text = quest.quest_name
		quest_name_button.toggle_mode = true
		quest_name_button.button_group = btn_group
		quest_name_button.add_theme_color_override("font_hover_color", Color.YELLOW)
		quest_name_button.add_theme_color_override("font_pressed_color", Color.YELLOW)
		quest_name_button.pressed.connect(self._quest_selected.bind(quest))
		
		if is_first_quest:
			quest_name_button.button_pressed = true
			is_first_quest = false
			_quest_selected(quest)
		
		add_child(quest_name_button)
		
		
func _quest_selected(quest):
	quest_description.text = quest.quest_description
	
	if quest.status == Quest.QuestStatus.Accepted:
		quest_status.text = "Active"
	elif quest.status == Quest.QuestStatus.Completed:
		quest_status.text = "Completed"
	elif quest.status == Quest.QuestStatus.Failed:
		quest_status.text = "Failed"
