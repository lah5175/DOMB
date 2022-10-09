extends Control


onready var memo_factory = preload("res://Interactables/Computer/MemoPopup.tscn");


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	$Tooltip.rect_position = get_global_mouse_position() + Vector2(5, 3);


func _on_Mail_mouse_entered():
	$Mail.modulate = Color(1, 1, 0.39, 1);
	$Tooltip.text = "Email";
	$Tooltip.visible = true;


func _on_Mail_mouse_exited():
	$Mail.modulate = Color(1, 1, 1, 1);
	$Tooltip.visible = false;


func _on_Browser_mouse_entered():
	$Browser.modulate = Color(1, 0.16, 1, 1);
	$Tooltip.text = "Browser";
	$Tooltip.visible = true;


func _on_Browser_mouse_exited():
	$Browser.modulate = Color(1, 1, 1, 1);
	$Tooltip.visible = false;


func _on_Files_mouse_entered():
	$Files.modulate = Color(0.05, 1, 0, 1);
	$Tooltip.text = "File System";
	$Tooltip.visible = true;


func _on_Files_mouse_exited():
	$Files.modulate = Color(1, 1, 1, 1);
	$Tooltip.visible = false;


func _on_Games_mouse_entered():
	$Games.modulate = Color(1, 0.63, 0, 1);
	$Tooltip.text = "Games";
	$Tooltip.visible = true;


func _on_Games_mouse_exited():
	$Games.modulate = Color(1, 1, 1, 1);
	$Tooltip.visible = false;


func _on_WorkMemo_mouse_entered():
	$WorkMemo.modulate = Color(0.42, 0.42, 0.42, 1);
	$Tooltip.text = "memo.txt";
	$Tooltip.visible = true;


func _on_WorkMemo_mouse_exited():
	$WorkMemo.modulate = Color(1, 1, 1, 1);
	$Tooltip.visible = false;


func _on_WorkMemo_gui_input(event):
	if event.is_pressed():
		var memo = memo_factory.instance();
		get_parent().add_child(memo);
		memo.rect_position = Vector2(100, 10);
