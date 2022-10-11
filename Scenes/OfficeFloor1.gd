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


func _on_WC1Trigger_body_entered(body):
	if body.get_class() == "Player":
		$WC1.current = true;


func _on_WC2Trigger_body_entered(body):
	if body.get_class() == "Player":
		$WC2.current = true;


func _on_WC3Trigger_body_entered(body):
	if body.get_class() == "Player":
		$WC3.current = true;


func _on_WC4Trigger_body_entered(body):
	if body.get_class() == "Player":
		$WC4.current = true;


func _on_WC5Trigger_body_entered(body):
	if body.get_class() == "Player":
		$WC5.current = true;


func _on_MC1Trigger_body_entered(body):
	if body.get_class() == "Player":
		$MC1.current = true;


func _on_MC2Trigger_body_entered(body):
	if body.get_class() == "Player":
		$MC2.current = true;


func _on_MC3Trigger_body_entered(body):
	if body.get_class() == "Player":
		$MC3.current = true;


func _on_MC4Trigger_body_entered(body):
	if body.get_class() == "Player":
		$MC4.current = true;


func _on_MC5Trigger_body_entered(body):
	if body.get_class() == "Player":
		$MC5.current = true;


func _on_EC1Trigger_body_entered(body):
	if body.get_class() == "Player":
		$EC1.current = true;


func _on_EC2Trigger_body_entered(body):
	if body.get_class() == "Player":
		$EC2.current = true;


func _on_EC3Trigger_body_entered(body):
	if body.get_class() == "Player":
		$EC3.current = true;


func _on_EC4Trigger_body_entered(body):
	if body.get_class() == "Player":
		$EC4.current = true;


func _on_EC5Trigger_body_entered(body):
	if body.get_class() == "Player":
		$EC5.current = true;
