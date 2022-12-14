extends Node2D


onready var player_factory = preload("res://Player_Components/Player.tscn");
onready var kitchen_player: Player = get_node("../ApartmentKitchen/Player");
onready var kitchen_cam: Camera2D = get_node("../ApartmentKitchen/KitchenCamera");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass





func _on_CameraTrigger_area_entered(area):
	if area.get_class() == "EntryTrigger":
		print("triggered")
		area.queue_free();
		$Player.current_player = true;
		$Player.visible = true;
		$BedroomCamera.current = true;


func _on_KitchenTrigger_body_entered(body):
	print("in kitchen exit")
	if $Player.current_player:
		$Player.current_player = false;
		$Player.visible = false;
		kitchen_player.current_player = true;
		kitchen_player.visible = true;
		kitchen_cam.current = true;
