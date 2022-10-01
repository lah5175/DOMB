extends PuzzleBox


export var solution: String;


const ENTRY_SCREEN = preload("res://UI_Components/TextInput.tscn");
var screen;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func do_input_puzzle():
	if !is_open:
		screen = ENTRY_SCREEN.instance();
		get_parent().add_child(screen);
		screen.connect("text_value", self, "_on_TextInputLineEdit_text_value");
	

func _on_TextInputLineEdit_text_value(text: String):
	print("in event")
	screen.queue_free();
	if text == solution:
		open();
