extends Control
class_name ShopMenu

@export var buy_ui: ShopBuyUI
@export var sell_ui: ShopSellUI
@export var player: PlayerController
@export var character_menu: CharacterMenu

var cur_buyable_items: Array[TradeableItem] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("quit_game"):
		cur_buyable_items = []
		character_menu.can_open = true
		visible = false
	
	if visible and not player.is_locked:
		player.lock()
	
	if visible and character_menu.can_open:
		character_menu.can_open = false

func update_and_show_shop_menu(buyable_items: Array[TradeableItem]):
	cur_buyable_items = buyable_items
	visible = true
	character_menu.can_open = false
	buy_ui.update_ui(buyable_items)
	sell_ui.update_ui()


func _on_tab_container_tab_changed(tab: int) -> void:
	update_and_show_shop_menu(cur_buyable_items)
