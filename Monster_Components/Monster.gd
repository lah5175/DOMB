extends KinematicBody2D
class_name Monster


var attack_damage: int;
var chase_speed: int;
var patrol_speed: int;
var can_attack: bool = true;
# TODO: Balance these values
var max_chase_dist: int = 300;
var min_chase_dist: int = 50; # Currently unused
var attack_dist: int = 100;

var face_direction: Vector2;
var direction_to_player: Vector2;
var velocity: Vector2;

onready var raycast: RayCast2D = $RayCast2D;
onready var player: Player;
onready var player_wr = weakref(player);
onready var starting_pos: Vector2 = global_position;

# Called when the node enters the scene tree for the first time.
func _ready():
#	visible = false;
	var countdown = get_node("/root/MainScene/CanvasLayer/UI/Countdown/CountdownBar");
	countdown.connect("otherworld_active", self, "_on_CountdownBar_otherworld_active");


#func _physics_process(delta):
#	if visible == true and player_wr.get_ref():
#		direction_to_player = global_position.direction_to(player.global_position);
#		raycast.enabled = true;
#		raycast.cast_to = direction_to_player * max_chase_dist;
#
#		if raycast.is_colliding():
#			var collider: Object = raycast.get_collider();
#			if collider.get_class() == "Player":
#				chase();
#			else:
#				patrol();
#		else:
#			patrol();


func attack():
	player.current_hp -= attack_damage;
	print("Dealt {damage} damage".format({"damage": attack_damage}));
	can_attack = false;
	$AttackTimer.start();


func chase():
	velocity = direction_to_player.normalized();
	move_and_slide(velocity * chase_speed, Vector2.ZERO);
	if global_position.distance_to(player.global_position) <= attack_dist and can_attack:
		attack();
		
		
#func patrol():
#	# Right now we'll just have the monster return to its starting location.
#	# We'll add more detailed pathfinding later.
#	velocity = global_position.direction_to(starting_pos);
#	move_and_slide(velocity * patrol_speed, Vector2.ZERO);
#	# At the moment, the enemy vibrates upon reaching its destination.
#	# This should be fixed if this patrol logic remains in the game.


func _on_AttackTimer_timeout():
	can_attack = true;


func _on_CountdownBar_otherworld_active():
	visible = true;
	$CollisionShape2D.disabled = false;
