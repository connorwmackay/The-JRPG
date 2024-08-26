extends Control
class_name InventoryUI

@export var item_scroll_list: ItemScrollList
@export var item_name: Label
@export var item_description: Label

func update_inventory():
	item_name.text = ""
	item_description.text = ""
	item_scroll_list.clear_items()
	
	for item in $"/root/InventorySystem".inventory:
		var item_btn = item_scroll_list.add_item(item.item_name)
		item_btn.pressed.connect(self._on_item_selected.bind(item))
		

func _on_item_selected(item: Item):
	item_name.text = item.item_name
	item_description.text = item.item_description
