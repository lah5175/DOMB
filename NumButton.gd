extends Button

signal number_pressed(num);

export var number: int;


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = str(number);


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_NumButton_pressed():
	emit_signal("number_pressed", number);
