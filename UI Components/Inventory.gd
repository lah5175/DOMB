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


func _on_Inventory_item_selected(index):
	current_index = index;
	current_item = get_item_metadata(index);
	print("Current item: ", current_item)
