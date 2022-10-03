extends Control


export var texture: StreamTexture;

var can_dismiss: bool = false;


func _ready():
	$TextureRect.texture = texture;


func get_class(): return "Popup";


func _on_DismissTimer_timeout():
	can_dismiss = true;
