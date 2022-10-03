extends Area2D


onready var inventory = get_node("/root/MainScene/CanvasLayer/UI/Inventory");
onready var manager = get_node("/root/MainScene/CanvasLayer/UI/DialogueManager");


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func inspect_with_key_item():
	# This code is a MESS, clean this up later
	# Also should ideally make this reusable
	if inventory.current_item == "broom":
		var dialogue: Array = ["You were able to use the broom to knock the note down from the bookshelf."];
		manager.set_dialogue(dialogue);
		get_parent().get_node("BookcaseClueSprite").queue_free();

		var texture: StreamTexture = load("res://Item_Components/Sprites/note.png");
		var tooltip: String = "Clue";
		var id: String = "apartment_clue_1";
		inventory.add_to_inventory(texture, tooltip, id);
		inventory.remove_item(inventory.current_index);
		inventory.reset_state();
		queue_free();
	else:
		var dialogue: Array = ["There appears to be something on top of the bookshelf, but you can't quite reach..."];
		manager.set_dialogue(dialogue);
