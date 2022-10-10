extends Node2D


onready var scene = get_parent();
onready var manager = get_node("/root/MainScene/CanvasLayer/UI/DialogueManager");


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BottomStairTrigger_body_entered(body):
	if scene.current_floor > 10:
		# Screen Transition here, but teleport to top stair
		scene.current_floor -= 1;
		$Player.position = Vector2(193, 25);
		$DoorManager.door_name = scene.floors[str(scene.current_floor)].elevator_floor;
		print(scene.current_floor)
	else:
		manager.set_dialogue(["The stairwell seems to have crumbled below. What the hell is going on?"])


func _on_TopStairTrigger_body_entered(body):
	if scene.current_floor < 13:
		scene.current_floor += 1;
		$Player.position = Vector2(49, 182);
		$DoorManager.door_name = scene.floors[str(scene.current_floor)].elevator_floor;
	else:
		manager.set_dialogue(["The roof is blocked off. I can't go any higher."])


func _on_DoorTrigger_area_entered(area):
	if area.get_class() == "EntryTrigger":
		area.queue_free();
		$Player.current_player = true;
		$Player.visible = true;
		$Camera2D.current = true;
		$DoorManager.door_name = scene.floors[str(scene.current_floor)].elevator_floor;
