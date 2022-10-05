extends Control

var global_player: Player;
var can_view: bool = true;

onready var inventory: Inventory = get_node("../Inventory");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass;


func show_image(image, player):
	if can_view:
		$Image.texture = image;
		inventory.visible = false;
		visible = true;
		player.can_act = false;
		global_player = player;


func _physics_process(delta):
	if visible and global_player:
		if Input.is_action_just_pressed("cancel") or Input.is_action_just_pressed("interact"):
			visible = false;
			inventory.visible = true;
			global_player.can_act = true;
			can_view = false;
			$ViewTimer.start();


func _on_ViewTimer_timeout():
	can_view = true;
