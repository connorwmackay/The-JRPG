extends GridContainer
class_name InventoryUI

var inventory: Array[Node] = []

@export var default_item_img: Texture2D
@export var btn_group: ButtonGroup

var inventory_ui_node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inventory_ui_node = preload("res://nodes/inventory_item.tscn")
	create_inventory()
	set_inventory_items()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_inventory():
	for i in range(6*6):
		inventory.append(Node.new())

func set_inventory_items():
	# Remove previous inventory items
	for child in get_children():
		child.queue_free()
	
	print(len(inventory))
	
	for item in inventory:
		var item_child = load("res://nodes/inventory_item.tscn").instantiate()
		item_child.button_group = btn_group
		add_child(item_child)
		
