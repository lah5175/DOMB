extends Control


const INVALID_FLOOR: Array = ["Hmm...for some reason this button isn't working. Is this elevator broken?"];
const SAME_FLOOR: Array = ["I'm already on that floor."];

onready var manager: DialogueManager = get_node("/root/MainScene/CanvasLayer/UI/DialogueManager");
onready var buttons: Area2D = get_node("/root/MainScene/OfficeScene/OfficeElevator/ElevatorButtons");
onready var scene: Node2D = get_node("/root/MainScene/OfficeScene");
onready var floors: Dictionary = scene.floors;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("cancel"):
		get_parent().get_node("Inventory").visible = true;
		queue_free();


func go_to_floor(flr: int):
	if scene.current_floor != flr:
		buttons.change_floor(flr);
		queue_free();
	else:
		manager.set_dialogue(SAME_FLOOR);


func _on_GButton_pressed():
	go_to_floor(0);


func _on_1Button_pressed():
	manager.set_dialogue(INVALID_FLOOR);


func _on_2Button_pressed():
	manager.set_dialogue(INVALID_FLOOR);


func _on_3Button_pressed():
	manager.set_dialogue(INVALID_FLOOR);


func _on_4Button_pressed():
	manager.set_dialogue(INVALID_FLOOR);


func _on_5Button_pressed():
	pass # Replace with function body.


func _on_6Button_pressed():
	pass # Replace with function body.


func _on_7Button_pressed():
	pass # Replace with function body.


func _on_8Button_pressed():
	pass # Replace with function body.


func _on_9Button_pressed():
	go_to_floor(9);


func _on_10Button_pressed():
	pass # Replace with function body.


func _on_11Button_pressed():
	pass # Replace with function body.


func _on_12Button_pressed():
	pass # Replace with function body.


func _on_13Button_pressed():
	go_to_floor(13);
