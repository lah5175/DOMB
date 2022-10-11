extends Node2D


const elevator_floor: String = "elevator_floor13";


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ElevatorTrigger_area_entered(area):
	if area.get_class() == "EntryTrigger":
		area.queue_free();
		$Player.current_player = true;
		$Player.visible = true;
		$LeftCam.current = true;



func _on_RightCamTrigger_body_entered(body):
	if body.get_class() == "Player":
		$RightCam.current = true;


func _on_LeftCamTrigger_body_entered(body):
	if body.get_class() == "Player":
		$LeftCam.current = true;
