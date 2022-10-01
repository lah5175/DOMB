extends ItemList
class_name Inventory


var current_item;
var current_index: int;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func reset_state():
	current_item = null;
	current_index = -1;


func add_to_inventory(texture: StreamTexture, tooltip: String, id: String):
	add_icon_item(texture);
	var index = get_item_count() - 1;
	set_item_tooltip(index, tooltip);
	set_item_metadata(index, id);


func _on_Inventory_item_selected(index):
	current_index = index;
	current_item = get_item_metadata(index);
	print("Current item: ", current_item)
