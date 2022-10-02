extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LivingRoomCameraTrigger_body_entered(body):
	$LivingRoomCamera.current = true;


func _on_KitchenCameraTrigger_body_entered(body):
	$KitchenCamera.current = true;
