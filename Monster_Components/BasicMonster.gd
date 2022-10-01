extends Monster


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	attack_damage = 20;
	chase_speed = 200;
	patrol_speed = 50;


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AttackTimer_timeout():
	can_attack = true;
