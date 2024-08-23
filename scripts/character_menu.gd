extends Control

var player: PlayerController
@export var quest_list: QuestList
@export var inventory_ui: InventoryUI

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	# Get the Player Node
	player = get_tree().get_first_node_in_group("player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle_character_menu"):
		quest_list.update_quest_list()
		inventory_ui.update_inventory()
		visible = not visible
		if player.is_locked:
			player.unlock()
		else:
			player.lock()
