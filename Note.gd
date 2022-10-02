extends Area2D


export var dialogue: Array;

onready var manager: DialogueManager = get_node("/root/MainScene/CanvasLayer/UI/DialogueManager");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func read_note():
	manager.set_dialogue(dialogue);
