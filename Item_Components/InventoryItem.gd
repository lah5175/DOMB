extends Node2D
class_name InventoryItem


export var item_tooltip: String;
export var item_id: String;

var sprite_path: String;
var texture: ImageTexture = ImageTexture.new();

var is_player_in_area: bool = false;

onready var inventory: Inventory = get_node("/root/MainScene/UI/Inventory");


# Called when the node enters the scene tree for the first time.
func _ready():
	pass;


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func render_texture():
	var image: Image = Image.new();
	image.load(sprite_path);
	texture.create_from_image(image);

func pick_up_item():
	inventory.add_icon_item(texture);
	var index = inventory.get_item_count() - 1;
	inventory.set_item_tooltip(index, item_tooltip);
	inventory.set_item_metadata(index, item_id);
	queue_free();
