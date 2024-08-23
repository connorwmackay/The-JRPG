extends Node
class_name InventoryManager

var inventory: Array[InteractableItem] = []

func add_item(item: InteractableItem):
	inventory.append(item)

func remove_item(item: InteractableItem):
	for i in range(len(inventory)):
		if inventory[i] == item:
			inventory.remove_at(i)
			return
