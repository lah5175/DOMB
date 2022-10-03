extends Area2D
class_name InventoryItem


export var item_tooltip: String;
export var item_id: String;
export var texture: StreamTexture;

var sprite_path: String;

var is_player_in_area: bool = false;

onready var inventory: Inventory = get_node("/root/MainScene/CanvasLayer/UI/Inventory");


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = texture;


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func pick_up_item():
	print("trying to pick up item")
	inventory.add_to_inventory(texture, item_tooltip, item_id);
	queue_free();


func get_class(): return "InventoryItem";
