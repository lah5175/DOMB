extends Node2D

export var required_key: String;
export var door_name: String;
export var is_locked: bool = false;

var locations: Dictionary = {
	"bedroom_door": Vector2(107, 170),
	"bathroom_door": Vector2(506, 95)
}

onready var trigger_factory = preload("res://Interactables/EntryTrigger.tscn");

# Called when the node enters the scene tree for the first time.
func _ready():
	$Door.required_key = required_key;
	$Door.door_name = door_name;
	$Door.is_locked = is_locked;


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Door_open_door(door_name, player):
	# This is a bit of a hack - I'm generating an Area2D to trigger a loading
	# area so I can transfer the camera/player to that map
	player.current_player = false;
	var trigger: Area2D = trigger_factory.instance();
	get_parent().add_child(trigger);
	trigger.global_position = locations[door_name];


func _on_Door_play_door_open():
	print("in play_door_open")
	$OpenSFX.play();
