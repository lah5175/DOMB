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


func _on_NorthCamTrigger_body_entered(body):
	if body.get_class() == "Player":
		$NorthCam.current = true;


func _on_MidCamTriggerN_body_entered(body):
	if body.get_class() == "Player":
		$MidCam.current = true;


func _on_MidCamTriggerSW_body_entered(body):
	if body.get_class() == "Player":
		$MidCam.current = true;


func _on_MidCamTriggerSE_body_entered(body):
	if body.get_class() == "Player":
		$MidCam.current = true;


func _on_SouthCamTriggerW_body_entered(body):
	if body.get_class() == "Player":
		$SouthCam.current = true;

func _on_SouthCamTriggerE_body_entered(body):
	if body.get_class() == "Player":
		$SouthCam.current = true;
