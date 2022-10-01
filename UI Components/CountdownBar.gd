extends TextureProgress

signal otherworld_active;

var has_triggered_signal: bool = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass;


func _process(delta):
	if value == 0 and !has_triggered_signal:
		emit_signal("otherworld_active");
		has_triggered_signal = true;


func _on_DecrementTimer_timeout():
	value -= 1; # TODO: Needs to be balanced later
