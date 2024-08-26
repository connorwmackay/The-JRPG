extends Control
class_name CharacterMenu

var player: PlayerController
@export var quest_list: QuestList
@export var inventory_ui: InventoryUI

var can_open: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	# Get the Player Node
	player = get_tree().get_first_node_in_group("player")
	can_open = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle_character_menu") and can_open:
		quest_list.update_quest_list()
		inventory_ui.update_inventory()
		visible = not visible
		if player.is_locked:
			player.unlock()
		else:
			player.lock()
	elif Input.is_action_just_pressed("quit_game"):
		visible = false
		player.unlock()
