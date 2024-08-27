extends Node
class_name GoldManager

var player_gold: float = 0.0

signal bought
signal sold

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_gold = 0.0

func can_buy(cost: float) -> bool:
	return player_gold >= cost
		
func buy(cost: float):
	if can_buy(cost):
		player_gold -= cost
		bought.emit()
	else:
		print("Error. Not enough gold to buy")

func sell(cost: float):
	player_gold += cost
	sold.emit()
