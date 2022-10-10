extends Node2D


onready var scene = get_parent();


func _on_ElevatorTrigger_area_entered(area):
	if area.get_class() == "EntryTrigger":
		area.queue_free();
		$Player.current_player = true;
		$Player.visible = true;
		$Camera2D.current = true;
		var floor_num: String = str(get_parent().current_floor);
		$DoorManager.door_name = scene.floors[floor_num].elevator_floor;
