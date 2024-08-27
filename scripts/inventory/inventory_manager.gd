extends Node
class_name InventoryManager

var inventory: Array[Item] = []

func add_item(item: Item):
	inventory.append(item)

func remove_item(item: Item):
	for i in range(len(inventory)):
		if inventory[i] == item:
			inventory.remove_at(i)
			return
