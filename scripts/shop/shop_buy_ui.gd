extends Control
class_name ShopBuyUI

@export var item_scroll_list: ItemScrollList
@export var item_description: Label
@export var item_price: Label
@export var buy_btn: Button

func update_ui(buyable_items: Array[TradeableItem]):
	item_description.text = ""
	item_price.text = ""
	buy_btn.visible = false
	item_scroll_list.clear_items()
	
	for item in buyable_items:
		var item_btn = item_scroll_list.add_item(item.item_name)
		item_btn.pressed.connect(self._on_item_selected.bind(item))

func _on_item_selected(item: TradeableItem):
	item_price.text = "{price} Gold".format({"price": item.buy_price})
	item_description.text = item.item_description
	buy_btn.visible = true
	buy_btn.pressed.disconnect(self._on_buy_pressed)
	buy_btn.pressed.connect(self._on_buy_pressed.bind(item))
	
func _on_buy_pressed(item: TradeableItem):
	item.add_item_to_inventory()
	print("Bought {name}".format({"name": item.item_name}))
