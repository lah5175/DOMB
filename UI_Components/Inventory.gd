extends ItemList
class_name Inventory

var current_item;
var current_index: int = -1;
var target_item;
var target_index: int = -1;

onready var CLUE_TEXTURE = load("res://Item_Components/Sprites/note.png");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func reset_state():
	current_item = null;
	current_index = -1;
	target_item = null;
	target_index = -1;


func add_to_inventory(texture: StreamTexture, tooltip: String, id: String):
	add_icon_item(texture);
	var index = get_item_count() - 1;
	set_item_tooltip(index, tooltip);
	set_item_metadata(index, id);
	
	
func combine_items():
	print("combining items")
	var success: bool = false;
	if (current_item == "knife" and target_item == "bear") or (current_item == "bear" and target_item == "knife"):
		add_to_inventory(CLUE_TEXTURE, "Clue", "apartment_clue_2");
		success = true;
	
	if success:
		if current_index > target_index:
			remove_item(current_index);
			remove_item(target_index);
		else:
			remove_item(target_index);
			remove_item(current_index);


func _on_Inventory_item_selected(index):
	current_index = index;
	current_item = get_item_metadata(index);
	print("Current item: ", current_item)
	if target_index > -1 and current_index != target_index:
		combine_items();


func _on_Inventory_item_rmb_selected(index, at_position):
	target_index = index;
	target_item = get_item_metadata(index);
