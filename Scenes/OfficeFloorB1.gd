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


func _on_NCTrigger_body_entered(body):
	if body.get_class() == "Player":
		$NC.current = true;


func _on_WCTriggerN_body_entered(body):
	if body.get_class() == "Player":
		$WC.current = true;


func _on_WCTriggerS_body_entered(body):
	if body.get_class() == "Player":
		$WC.current = true;


func _on_SWCTriggerN_body_entered(body):
	if body.get_class() == "Player":
		$SWC.current = true;


func _on_SWCTriggerE_body_entered(body):
	if body.get_class() == "Player":
		$SWC.current = true;


func _on_SCTriggerW_body_entered(body):
	if body.get_class() == "Player":
		$SC.current = true;


func _on_SCTriggerE_body_entered(body):
	if body.get_class() == "Player":
		$SC.current = true;


func _on_SECTrigger_body_entered(body):
	if body.get_class() == "Player":
		$SEC.current = true;
