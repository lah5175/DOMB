extends KinematicBody2D
class_name Player

export var current_player: bool = false;

var max_hp: int = 100;
var current_hp: int = 100;
var move_speed: int = 100;
var interact_dist: int = 70;

var can_act: bool = true;

var velocity: Vector2 = Vector2();
var face_direction: Vector2 = Vector2();

onready var raycast: RayCast2D = $RayCast2D;
onready var inventory: Inventory = get_node("/root/MainScene/CanvasLayer/UI/Inventory");
onready var dialogue_manager: DialogueManager = get_node("/root/MainScene/CanvasLayer/UI/DialogueManager");


# Called when the node enters the scene tree for the first time.
func _ready():
	face_direction.y = 1;
	dialogue_manager.connect("dialogue_started", self, "_on_DialogueManager_dialogue_started");
	dialogue_manager.connect("dialogue_finished", self, "_on_DialogueManager_dialogue_finished");


func _physics_process(delta):
	if current_player and can_act:
		if current_hp < 1:
			queue_free();
		
		move();
		try_interact();


func move():
	velocity = Vector2();
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1;
		face_direction = Vector2(0, -1);
	if Input.is_action_pressed("move_down"):
		velocity.y += 1;
		face_direction = Vector2(0, 1);
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1;
		face_direction = Vector2(-1, 0);
	if Input.is_action_pressed("move_right"):
		velocity.x += 1;
		face_direction = Vector2(1, 0);

	raycast.cast_to = face_direction * interact_dist;
	velocity = velocity.normalized();
	move_and_slide(velocity * move_speed, Vector2.ZERO);


func try_interact():
	if Input.is_action_just_pressed("interact"):
		if raycast.is_colliding():
			var collider: Object = raycast.get_collider();
			if collider.has_method("read_note"):
				collider.read_note();
			elif collider.has_method("pick_up_item"):
				collider.pick_up_item();
			elif collider.has_method("open_door"):
				collider.open_door(self);
			elif collider.has_method("do_input_puzzle"):
				collider.do_input_puzzle();
		
		use_consumable(inventory);
			

# TODO: Consider extracting to a utility class
func use_consumable(inventory: Inventory):
	if inventory.current_index < 0:
		return;
	
	var item_used: bool = false;
	if inventory.current_item == "apple":
		current_hp = clamp(current_hp + 20, 0, 100);
		item_used = true;
	
	if item_used:
		inventory.remove_item(inventory.current_index);
		inventory.reset_state();


func get_class(): return "Player";


func _on_DialogueManager_dialogue_finished():
	can_act = true;
	
	
func _on_DialogueManager_dialogue_started():
	can_act = false;
