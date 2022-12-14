extends Node2D


onready var kitchen_player: Player = get_node("../ApartmentKitchen/Player");
onready var kitchen_cam: Camera2D = get_node("../ApartmentKitchen/KitchenCamera");
onready var full_img: Control = get_node("/root/MainScene/CanvasLayer/UI/FullScreenImage");
onready var CLEANING_PROD: StreamTexture = load("res://UI_Components/Sprites/cleaning_chemicals.png");


# Called when the node enters the scene tree for the first time.
func _ready():
	$CleaningProducts/CollisionShape2D.disabled = true;


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BathroomCameraTrigger_area_entered(area):
	if area.get_class() == "EntryTrigger":
		print("triggered")
		area.queue_free();
		$Player.current_player = true;
		$Player.visible = true;
		$BathroomCamera.current = true;


func _on_KitchenTrigger_body_entered(body):
	print("in kitchen exit")
	if $Player.current_player:
		$Player.current_player = false;
		$Player.visible = false;
		kitchen_player.current_player = true;
		kitchen_player.visible = true;
		kitchen_cam.current = true;


func _on_SinkNumPuzzle_num_puzzle_solved(node_name):
	full_img.show_image(CLEANING_PROD, $Player);
	$CleaningProducts/CollisionShape2D.disabled = false;
	$SinkNumPuzzle/CollisionShape2D.disabled = true;
