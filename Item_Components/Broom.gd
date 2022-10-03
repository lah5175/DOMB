extends InventoryItem


# Called when the node enters the scene tree for the first time.
func _ready():
	texture = load("res://Item_Components/Sprites/broom.png");
	item_tooltip = "Broom"
	item_id = "broom"
