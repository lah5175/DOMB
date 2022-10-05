extends Area2D


export var image: StreamTexture;

onready var full_img: Control = get_node("/root/MainScene/CanvasLayer/UI/FullScreenImage");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func display_fullscreen_image(player: Player):
	print("collided with fsi")
	full_img.show_image(image, player);
