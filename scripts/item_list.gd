extends Control
class_name ItemScrollList

@onready var vbox_container: VBoxContainer = get_node("ScrollContainer/VBoxContainer")
@export var btn_group: ButtonGroup

@export var scroll_container_size: Vector2
@export var minimum_button_size: Vector2

func _ready():
	if scroll_container_size != null:
		get_node("ScrollContainer").size = scroll_container_size

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
	item_btn.add_theme_color_override("font_pressed_color", Color.YELLOW)
	
	if minimum_button_size != null:
		item_btn.custom_minimum_size = minimum_button_size
	
	vbox_container.add_child(item_btn)
	return item_btn
