extends Node2D


const elevator_floor: String = "elevator_lounge";


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
		$Camera2D.current = true;
