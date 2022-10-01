extends InventoryItem

# Called when the node enters the scene tree for the first time.
func _ready():
	texture = load("res://Item_Components/Sprites/apple.png");
	item_tooltip = "Apple"
	item_id = "apple"
