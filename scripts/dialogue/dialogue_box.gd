extends Control

var dialogue_queue: Array[DialogueItem] = []
@export var name_label: Label
@export var text_label: Label
@export var scroll_wait_time: float = 0.3
@export var top_dialogue_choice: Button
@export var bottom_dialogue_choice: Button
@export var shop_menu: ShopMenu
@export var character_menu: CharacterMenu

var prev_dq_len = -1
var player: PlayerController = null

var is_making_choice: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Get the Player Node
	player = get_tree().get_first_node_in_group("player")
	
	dialogue_queue = []
	is_making_choice = false
	hide_choices()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Check if the dialogue queue has changed
	if prev_dq_len != len(dialogue_queue):
		update_dialogue()
		prev_dq_len = len(dialogue_queue)
	
	# Skip scrolling text or continue dialogue
	if Input.is_action_just_pressed("dialogue_continue"):
		if text_label.visible_characters < len(text_label.text):
			text_label.visible_characters = len(text_label.text)
		elif not is_making_choice:
			if len(dialogue_queue) > 0:
				if dialogue_queue[0] is DialogueShowShop:
					shop_menu.update_and_show_shop_menu(dialogue_queue[0].buyable_items)
				elif dialogue_queue[0] is ItemRewardDialogueItem:
					$"/root/InventorySystem".add_item(dialogue_queue[0].item)
				elif dialogue_queue[0] is GoldRewardDialogueItem:
					$"/root/GoldSystem".player_gold += dialogue_queue[0].gold_reward
				dialogue_queue.remove_at(0)

# Update the dialogue box
func update_dialogue():
	# If there is no dialogue queued, unlock the player and 
	# make hide this dialogue box.
	if len(dialogue_queue) == 0:
		character_menu.can_open = true
		is_making_choice = false
		hide_choices()
		player.unlock()
		visible = false
	# Lock the player, show this dialogue box and start the first piece
	# of dialogue.
	else:
		character_menu.can_open = false
		player.lock()
		visible = true
		name_label.text = dialogue_queue[0].speaker_name
		text_label.text = dialogue_queue[0].text
		if dialogue_queue[0] is DialogueQuestRequest:
			is_making_choice = true
			show_choices(dialogue_queue[0].top_choice_text, dialogue_queue[0].bottom_choice_text)
		elif dialogue_queue[0] is DialogueCompleteQuest:
			dialogue_queue[0].quest.complete()
			$"/root/QuestSystem".notify_quest_update()
		
		text_label.visible_characters = 1
		scroll_text()

# Do scrolling text for the current dialogue text
func scroll_text():
	# Wait X seconds
	await get_tree().create_timer(scroll_wait_time).timeout
	# Only scroll text if there are still characters that need to be shown
	if text_label.visible_characters < len(text_label.text):
		text_label.visible_characters += 1
		scroll_text()
			

# Queue a piece of dialogue
func queue_dialogue(dialogue_item: DialogueItem):
	dialogue_queue.append(dialogue_item)

func show_choices(top_choice_text: String, bottom_choice_text: String):
	top_dialogue_choice.text = top_choice_text
	top_dialogue_choice.visible = true
	
	bottom_dialogue_choice.text = bottom_choice_text
	bottom_dialogue_choice.visible = true

func hide_choices():
	top_dialogue_choice.text = ""
	top_dialogue_choice.visible = false
	
	bottom_dialogue_choice.text = ""
	bottom_dialogue_choice.visible = false

func _on_dialogue_choice_bottom_pressed() -> void:
	is_making_choice = false
	hide_choices()
	dialogue_queue.remove_at(0)


func _on_dialogue_choice_top_pressed() -> void:
	is_making_choice = false
	hide_choices()
	
	if dialogue_queue[0] is DialogueQuestRequest:
		var quest = dialogue_queue[0].quest_if_top_choice
		if quest != null:
			quest.accept()
			$"/root/QuestSystem".add_quest(quest)
		
	dialogue_queue.remove_at(0)
