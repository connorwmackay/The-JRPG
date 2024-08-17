extends Control

var dialogue_queue: Array[DialogueItem] = []
@export var name_label: Label
@export var text_label: Label
@export var scroll_wait_time: float = 0.3

var prev_dq_len = -1
var player: PlayerController = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Get the Player Node
	player = get_tree().get_first_node_in_group("player")
	
	dialogue_queue = []

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
		else:
			dialogue_queue.remove_at(0)

# Update the dialogue box
func update_dialogue():
	# If there is no dialogue queued, unlock the player and 
	# make hide this dialogue box.
	if len(dialogue_queue) == 0:
		player.is_locked = false
		visible = false
	# Lock the player, show this dialogue box and start the first piece
	# of dialogue.
	else:
		player.is_locked = true
		visible = true
		name_label.text = dialogue_queue[0].speaker_name
		text_label.text = dialogue_queue[0].text
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
