extends KinematicBody2D

export var required_key: String;

onready var inventory = get_node("/root/MainScene/UI/Inventory");


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func open_key_lock():
	if inventory.current_item == required_key:
		inventory.remove_item(inventory.current_index);
		inventory.reset_state();
		queue_free();
	else:
		print("Missing required key"); # TODO: Replace with message
