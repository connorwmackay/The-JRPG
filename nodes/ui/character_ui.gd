extends Control
class_name CharacterUI

@export var player_gold_label: Label

func set_player_gold_text():
	player_gold_label.text = "You Have {gold} Gold".format({"gold": $"/root/GoldSystem".player_gold})

func update():
	set_player_gold_text()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_player_gold_text()
