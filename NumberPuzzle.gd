extends PuzzleBox

signal num_puzzle_solved(node_name);


export var solution: String;


const ENTRY_SCREEN = preload("res://Interactables/Numpad.tscn");
var screen;


onready var ui = get_node("/root/MainScene/CanvasLayer/UI");


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func do_input_puzzle():
	if !is_open:
		screen = ENTRY_SCREEN.instance();
		ui.add_child(screen);
		screen.solution = solution;
		screen.connect("is_solved", self, "_on_NumInputLineEdit_is_solved");
		
		
func _on_NumInputLineEdit_is_solved():
	emit_signal("num_puzzle_solved", name);
	screen.queue_free();
	open();
