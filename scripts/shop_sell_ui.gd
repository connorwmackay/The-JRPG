extends Control
class_name ShopSellUI

@export var item_scroll_list: ItemScrollList
@export var item_description: Label
@export var item_price: Label
@export var sell_btn: Button

func update_ui():
	item_description.text = ""
	item_price.text = ""
	sell_btn.visible = false
	item_scroll_list.clear_items()
	
	for item in $"/root/InventorySystem".inventory:
		if item is TradeableItem:
			var item_btn = item_scroll_list.add_item(item.item_name)
			item_btn.pressed.connect(self._on_item_selected.bind(item))

func _on_item_selected(item: Item):
	item_description.text = item.item_description
	item_price.text = "{price} Gold".format({"price": item.buy_price})
	sell_btn.visible = true
	sell_btn.pressed.disconnect(self._on_sell_pressed)
	sell_btn.pressed.connect(_on_sell_pressed.bind(item))

func _on_sell_pressed(item: TradeableItem):
	$"/root/InventorySystem".remove_item(item)
	update_ui()
