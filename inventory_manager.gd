extends Node
class_name InventoryManager

var inventory: Array[InteractableItem] = []

func add_item(item: InteractableItem):
	inventory.append(item)
