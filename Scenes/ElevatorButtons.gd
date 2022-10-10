extends Area2D


onready var scene: Node2D = get_node("../..");
onready var ui: Control = get_node("/root/MainScene/CanvasLayer/UI");
onready var buttons: PackedScene = preload("res://Interactables/ElevatorButtons.tscn");
onready var player: Player = get_node("../Player");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass;


func change_floor(flr: int):
	var floor_node: Node2D = scene.floors[str(flr)];
	player.can_act = false;
	$MovingSFX.play();
	yield($MovingSFX, "finished");
	scene.current_floor = flr;
	get_node("../DoorManager").door_name = floor_node.elevator_floor;
	player.can_act = true;
	print("Changed to floor: ", flr);
	

func use_elevator_buttons():
	var btns: Control = buttons.instance();
	ui.add_child(btns);
	ui.move_child(btns, 2);
	ui.get_node("Inventory").visible = false;
