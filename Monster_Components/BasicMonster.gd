extends Monster


var direction: int = 1;
var last_position: Vector2;
var last_offset;
var last_unit_offset;

onready var pathfollow = get_parent();

# Called when the node enters the scene tree for the first time.
func _ready():
	attack_damage = 20;
	chase_speed = 100;
	patrol_speed = 50;
	player = get_node("../../../Player"); # SPAGHETTI CODE AAAAAAAAAH
	player_wr = weakref(player);
	last_position = global_position


func _physics_process(delta):
	if visible == true and player_wr.get_ref():
		direction_to_player = global_position.direction_to(player.global_position);
		raycast.enabled = true;
		raycast.cast_to = direction_to_player * max_chase_dist;

		if raycast.is_colliding():
			var collider: Object = raycast.get_collider();
			if collider.get_class() == "Player":
				chase();
			else:
				patrol(delta);
		else:
			patrol(delta);
			

func patrol(delta):
	if global_position != last_position:
		return_to_path();
	else:
		if direction == 1:
			if pathfollow.unit_offset >= 0.95:
				yield(get_tree().create_timer(0.3), "timeout");
				rotation_degrees = lerp(rotation_degrees, -90, 0.1);
				$RayCast2D.rotation_degrees = 0;
				yield(get_tree().create_timer(1), "timeout");
				direction = 0;
			else:
				pathfollow.offset += patrol_speed * delta;
				last_position = global_position;
		else:
			if pathfollow.unit_offset <= 0.05:
				yield(get_tree().create_timer(0.3), "timeout");
				rotation_degrees = lerp(rotation_degrees, 90, 0.1);
				$RayCast2D.rotation_degrees = 180;
				yield(get_tree().create_timer(1), "timeout");
				direction = 1;
			else:
				pathfollow.offset -= patrol_speed * delta;
				last_position = global_position;
	
	
func return_to_path():
	if global_position.distance_to(last_position) < 0.5:
		global_position = last_position;
	else:
		velocity = global_position.direction_to(last_position).normalized();
		move_and_slide(velocity * patrol_speed, Vector2.ZERO);


func _on_AttackTimer_timeout():
	can_attack = true;
