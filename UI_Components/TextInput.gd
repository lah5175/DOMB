extends Node2D


signal text_value(text);


var signal_triggered: bool = false;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if $TextInputLineEdit.editable == false and !signal_triggered:
		emit_signal("text_value", $TextInputLineEdit.text)
		signal_triggered = true;
