extends Control

signal is_solved;

export var solution: String;

var entry_arr: Array;
var entry_str: String;
var is_solved: bool = false;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func reset_state():
	entry_arr.clear();
	entry_str = "";
	update_time();
	
	
func check_solution():
	for digit in entry_arr:
		entry_str += str(digit);
	if entry_str == solution:
		is_solved = true;
		emit_signal("is_solved");
	else:
		print("Resetting...")
		reset_state();

func update_time():
	# Resets microwave time display	
	var time_arr: Array = [0, 0, ":", 0, 0]
	var counter: int = len(entry_arr) - 1;
	for i in range(4, -1, -1):
		if counter < 0:
			break;
		if i == 2:
			continue;
		time_arr[i] = entry_arr[counter];
		counter -= 1;
	
	var time_str: String;
	for digit in time_arr:
		time_str += str(digit);
		$Time.text = time_str;	
	
	
func append_digit(digit):
	if len(entry_arr) < 4 and !is_solved:
		entry_arr.append(digit);
		update_time();


func _on_Num1_number_pressed(num):
	append_digit(num);


func _on_Num2_number_pressed(num):
	append_digit(num);


func _on_Num3_number_pressed(num):
	append_digit(num);


func _on_Num4_number_pressed(num):
	append_digit(num);


func _on_Num5_number_pressed(num):
	append_digit(num);


func _on_Num6_number_pressed(num):
	append_digit(num);


func _on_Num7_number_pressed(num):
	append_digit(num);


func _on_Num8_number_pressed(num):
	append_digit(num);


func _on_Num9_number_pressed(num):
	append_digit(num);


func _on_Num0_number_pressed(num):
	append_digit(num);


func _on_Confirm_pressed():
	if !is_solved:
		check_solution();


func _on_Clear_pressed():
	if !is_solved:
		reset_state();
