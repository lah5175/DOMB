extends Node2D
class_name PuzzleBox


export var texture: StreamTexture;
export var contents_tooltip: String;
export var contents_id: String;

var is_open: bool = false;

onready var inventory: Inventory = get_node("/root/MainScene/CanvasLayer/UI/Inventory");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func open():
	if !is_open:
		if len(contents_tooltip) and len(contents_id):
			# That means this is an item box
			inventory.add_to_inventory(texture, contents_tooltip, contents_id);
			is_open = true;
			# Change animation here to open
		else:
			# This is a puzzle box
			is_open = true;
			print("post-puzzle logic goes here!");
