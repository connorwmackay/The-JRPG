extends Control
class_name ItemScrollList

@onready var vbox_container: VBoxContainer = get_node("ScrollContainer/VBoxContainer")
@export var btn_group: ButtonGroup

## Removes all the items in the item scroll list
func clear_items():
	for child in vbox_container.get_children():
		child.queue_free()

## Adds an item to the item scroll list and returns the newly created node
func add_item(item_name: String) -> Button:
	var item_btn: Button = Button.new()
	item_btn.text = item_name
	item_btn.toggle_mode = true
	item_btn.button_group = btn_group
	item_btn.add_theme_color_override("font_hover_color", Color.LIGHT_YELLOW)
	item_btn.add_theme_color_override("font_pressed_color", Color.YELLOW)
	vbox_container.add_child(item_btn)
	return item_btn
