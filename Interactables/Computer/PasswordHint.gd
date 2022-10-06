extends Label


var hint_shown: bool = false;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_PasswordHint_mouse_entered():
	if !hint_shown:
		add_color_override("font_color", Color(1,1,1,1));


func _on_PasswordHint_mouse_exited():
	if !hint_shown:
		add_color_override("font_color", Color(0.78, 0.6, 0.6, 1));


func _on_PasswordHint_gui_input(event):
	if event.is_pressed():
		text = "Pu4-7, Y1, Pi1-3, G2-3";
		add_color_override("font_color", Color(1,1,1,1));
		mouse_default_cursor_shape = Control.CURSOR_ARROW;
		hint_shown = true;
