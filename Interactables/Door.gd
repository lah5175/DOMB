extends KinematicBody2D

signal open_door(door_name, player);

export var required_key: String;
export var door_name: String;
export var is_locked: bool = false;

onready var inventory = get_node("/root/MainScene/CanvasLayer/UI/Inventory");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func open_door(player: Player):
	var anim: AnimationPlayer = $AnimationPlayer;
	if is_locked:
		if inventory.current_item == required_key:
			inventory.remove_item(inventory.current_index);
			inventory.reset_state();
			is_locked = false;
			anim.play("Open");
			yield(anim, "animation_finished");
			emit_signal("open_door", door_name, player);
			$DelayTimer.start();
		else:
			print("Missing required key"); # TODO: Replace with message
	else:
		anim.play("Open");
		yield(anim, "animation_finished");
		emit_signal("open_door", door_name, player);
		$DelayTimer.start();


func _on_DelayTimer_timeout():
	$Sprite.frame = 0;
