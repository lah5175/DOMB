extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if Input.is_action_just_pressed("cancel"):
		queue_free();


func _on_CloseButton_gui_input(event):
	if event.is_pressed():
		queue_free();
