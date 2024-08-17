extends Control

var dialogue_queue: Array = []
@export var name_label: Label
@export var text_label: Label
@export var scroll_wait_time: float = 0.3

var prev_dq_len = -1
var player: PlayerController = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	dialogue_queue = []

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if prev_dq_len != len(dialogue_queue):
		update_dialogue()
		prev_dq_len = len(dialogue_queue)
	
	if Input.is_action_just_pressed("dialogue_continue"):
		if text_label.visible_characters < len(text_label.text):
			text_label.visible_characters = len(text_label.text)
		else:
			dialogue_queue.remove_at(0)

func update_dialogue():
	if len(dialogue_queue) == 0:
		player.is_locked = false
		visible = false
	else:
		player.is_locked = true
		visible = true
		name_label.text = dialogue_queue[0].name
		text_label.text = dialogue_queue[0].text
		text_label.visible_characters = 1
		scroll_text()

func scroll_text():
	await get_tree().create_timer(scroll_wait_time).timeout
	if text_label.visible_characters < len(text_label.text):
		text_label.visible_characters += 1
		scroll_text()
			

func queue_dialogue(name: String, text: String):
	dialogue_queue.append({"name": name, "text": text})
