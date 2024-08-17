extends Node
class_name QuestManager

var quests: Array[Quest] = []
var num_quests: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Started quest system...")
	num_quests = len(quests)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if len(quests) != num_quests:
		num_quests = len(quests)
		print(num_quests)
