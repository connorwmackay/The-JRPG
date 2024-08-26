extends Node
class_name Item

@export var item_name: String = ""
@export var item_description: String = ""

signal found()

func add_item_to_inventory():
	$"/root/InventorySystem".inventory.append(self)
	found.emit()
