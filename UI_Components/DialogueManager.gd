extends Control
class_name DialogueManager


signal dialogue_started;
signal dialogue_finished; 


var is_showing: bool = false;
var can_read: bool = true;
var dialogue_arr: Array;
var index: int = 0;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func _physics_process(delta):
	if Input.is_action_just_pressed("interact") and is_showing:
		advance_dialogue();
	

func set_dialogue(dialogue: Array):
	if can_read:
		can_read = false;
		dialogue_arr = dialogue;
		emit_signal("dialogue_started");
		advance_dialogue();
	

func show_dialogue():
	var dialogue = DialogNode.instance();
	add_child(dialogue);
	dialogue.show_text(dialogue_arr[index]);
	is_showing = true;
	get_parent().get_node("Inventory").visible = false;
	index += 1;


func clear_dialogue():
	for child in get_children():
		if child != $CompleteTimer:
			child.queue_free();


func advance_dialogue():
	clear_dialogue();
	if index < len(dialogue_arr):
		show_dialogue();
	else:
		index = 0;
		is_showing = false;
		get_parent().get_node("Inventory").visible = true;
		emit_signal("dialogue_finished");
		$CompleteTimer.start();


func _on_CompleteTimer_timeout():
	print("you can read again")
	can_read = true;
