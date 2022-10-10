extends Node2D

export var required_key: String;
export var door_name: String;
export var is_locked: bool = false;
export(PackedScene) var door_type;

var locations: Dictionary = {
	"bedroom_door": Vector2(107, 170),
	"bathroom_door": Vector2(506, 95),
	"elevator": Vector2(673, 99),
	"elevator_reception": Vector2(80, 65),
	"elevator_floor13": Vector2(319, 305),
	"elevator_lounge": Vector2(319, 60),
	"stairwell": Vector2(1448, 137)
}

onready var trigger_factory = preload("res://Interactables/EntryTrigger.tscn");

# Called when the node enters the scene tree for the first time.
func _ready():
	var door: Door = door_type.instance();
	add_child(door);
	door.connect("open_door", self, "_on_Door_open_door");
	door.connect("play_door_open", self, "_on_Door_play_door_open");
	$Door.required_key = required_key;
	$Door.door_name = door_name;
	$Door.is_locked = is_locked;


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Door_open_door(door, player):
	# This is a bit of a hack - I'm generating an Area2D to trigger a loading
	# area so I can transfer the camera/player to that map
	player.current_player = false;
	var trigger: Area2D = trigger_factory.instance();
	get_parent().add_child(trigger);
	print("door_name: ", door_name);
	trigger.global_position = locations[door_name];


func _on_Door_play_door_open():
	print("in play_door_open")
	$Door/OpenSFX.play();
