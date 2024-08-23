extends Quest
class_name ItemFetchQuest

@export var item: InteractableItem
@export var description_if_item_found: String

func _ready() -> void:
	status = QuestStatus.NotAccepted
	item.found.connect(_on_found_item)

func _on_found_item():
	quest_giver_npc.current_dialogue_tree_name = quest_id + "_found"
	quest_description = description_if_item_found

func _process(delta) -> void:
	if status == QuestStatus.Completed:
		$"/root/InventorySystem".remove_item(item)
