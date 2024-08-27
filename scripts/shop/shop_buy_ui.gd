extends Control
class_name ShopBuyUI

@export var item_scroll_list: ItemScrollList
@export var item_description: Label
@export var item_price: Label
@export var buy_btn: Button
@export var player_gold_label: Label

var cur_buyable_items: Array[TradeableItem] = []

func update_ui(buyable_items: Array[TradeableItem]):
	cur_buyable_items = buyable_items
	item_description.text = ""
	item_price.text = ""
	player_gold_label.text = "You Have {gold} Gold".format({"gold": $"/root/GoldSystem".player_gold})
	buy_btn.visible = false
	item_scroll_list.clear_items()
	
	for item in buyable_items:
		var item_btn = item_scroll_list.add_item(item.item_name)
		item_btn.pressed.connect(self._on_item_selected.bind(item))

func _on_item_selected(item: TradeableItem):
	item_price.text = "Costs {price} Gold".format({"price": item.buy_price})
	item_description.text = item.item_description
	buy_btn.visible = true
	buy_btn.pressed.disconnect(self._on_buy_pressed)
	
	if not $"/root/GoldSystem".can_buy(item.buy_price):
		buy_btn.disabled = true
	else:
		buy_btn.disabled = false
		buy_btn.pressed.connect(self._on_buy_pressed.bind(item))
	
func _on_buy_pressed(item: TradeableItem):
	if $"/root/GoldSystem".can_buy(item.buy_price):
		item.add_item_to_inventory()
		$"/root/GoldSystem".buy(item.buy_price)
		print("Bought {name}".format({"name": item.item_name}))
	update_ui(cur_buyable_items)
