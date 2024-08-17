extends Node
class_name Quest

enum QuestStatus {
	NotAccepted,
	Accepted,
	Completed,
	Failed
}

@export var quest_name: String = ""
@export var quest_id: String = ""
@export var quest_description: String = ""
@export var status: QuestStatus = QuestStatus.NotAccepted
@export var quest_giver_npc: NPCController = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	status = QuestStatus.NotAccepted

## Accepts this quest and updates the quest giver NPC's dialogue tree to: quest_id + "_accepted"
func accept():
	quest_giver_npc.current_dialogue_tree_name = quest_id + "_accepted"
	status = QuestStatus.Accepted

## Completes this quest and updates the quest giver NPC's dialogue tree to: quest_id + "_completed"
func complete():
	quest_giver_npc.current_dialogue_tree_name = quest_id + "_completed"
	status = QuestStatus.Completed

## Fails this quest and updates the quest giver NPC's dialogue tree to: quest_id + "_failed"
func fail():
	quest_giver_npc.current_dialogue_tree_name = quest_id + "_failed"
	status = QuestStatus.Failed

## Creates an instance of this class
static func create(new_quest_name: String, new_quest_id: String, new_quest_description: String, new_status: QuestStatus, new_quest_giver_npc: NPCController = null):
	var inst = Quest.new()
	inst.quest_id = new_quest_id
	inst.quest_name = new_quest_name
	inst.quest_description = new_quest_description
	inst.status = new_status
	inst.quest_giver_npc = new_quest_giver_npc
	return inst
