extends Area2D


onready var ui = get_node("/root/MainScene/CanvasLayer/UI");
onready var login = preload("res://Interactables/Computer/LoginScreen.tscn");


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func show_computer_screen(player: Player):
	var screen = login.instance();
	player.can_act = false;
	screen.player = player;
	ui.add_child(screen);
