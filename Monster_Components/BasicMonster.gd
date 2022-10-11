extends Monster


var direction: int = 1;

onready var pathfollow = get_parent();

# Called when the node enters the scene tree for the first time.
func _ready():
	attack_damage = 20;
	chase_speed = 100;
	patrol_speed = 50;
	player = get_node("../../../Player"); # SPAGHETTI CODE AAAAAAAAAH
	player_wr = weakref(player);


func _physics_process(delta):
	if visible == true and player_wr.get_ref():
		direction_to_player = global_position.direction_to(player.global_position);
		raycast.enabled = true;
		raycast.cast_to = direction_to_player * max_chase_dist;

		if raycast.is_colliding():
			print("colliding")
			var collider: Object = raycast.get_collider();
			print(collider)
			if collider.get_class() == "Player":
				chase();
			else:
				patrol(delta);
		else:
			patrol(delta);
			

func patrol(delta):
	if direction == 1:
		if pathfollow.unit_offset >= 0.95:
			yield(get_tree().create_timer(0.3), "timeout");
			rotation_degrees = lerp(rotation_degrees, -90, 0.1);
			yield(get_tree().create_timer(1), "timeout");
			direction = 0;
		else:
			pathfollow.offset += patrol_speed * delta;
	else:
		if pathfollow.unit_offset <= 0.05:
			yield(get_tree().create_timer(0.3), "timeout");
			rotation_degrees = lerp(rotation_degrees, 90, 0.1);
			yield(get_tree().create_timer(1), "timeout");
			direction = 1;
		else:
			pathfollow.offset -= patrol_speed * delta;


func _on_AttackTimer_timeout():
	can_attack = true;
