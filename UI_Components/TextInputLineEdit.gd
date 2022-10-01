extends LineEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	grab_focus();
	set_cursor_position(len(text));


func _physics_process(delta):
	if Input.is_action_just_pressed("confirm"):
		editable = false;
