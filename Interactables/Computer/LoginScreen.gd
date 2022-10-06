extends Control


var player: Player;


func _physics_process(delta):
	if Input.is_action_just_pressed("cancel"):
		queue_free();
		player.can_act = true;


func check_password():
	var entry: String = $LineEdit.text;
	if entry == "tastYBeans":
		print("You beat map 1!")
	else:
		$LineEdit.add_color_override("font_color", Color(1, 0, 0, 1));


func _on_Button_pressed():
	check_password();


func _on_LineEdit_text_changed(new_text):
	$LineEdit.add_color_override("font_color", Color(0, 0, 0, 1));


func _on_LineEdit_text_entered(new_text):
	check_password();
