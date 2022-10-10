extends Node2D


# Keeps track of the current floor for the elevator
onready var current_floor: int = 0;

onready var floors: Dictionary = {
	"0": $OfficeReception,
	"9": $OfficeLounge,
	"10": $OfficeFloor13,
	"11": $OfficeFloor13,
	"12": $OfficeFloor13,
	"13": $OfficeFloor13
}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
