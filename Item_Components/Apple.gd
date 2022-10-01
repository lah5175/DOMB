extends InventoryItem

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_path = "res://Item_Components/Sprites/apple.png"
	render_texture();
	item_tooltip = "Apple"
	item_id = "apple"
