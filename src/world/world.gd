extends Node2D

@export var rock := preload("res://src/rock/rock.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.change_pause_game.connect(handle_pause_game)
	pass # Replace with function body.

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("ui_cancel")):
		handle_pause_game()

func handle_pause_game() -> void:
	$PauseButton.visible = not $PauseButton.visible
	$PauseMenu.visible = not $PauseMenu.visible
	get_tree().paused = not get_tree().paused

func _on_timer_new_rock_timeout() -> void:
	var new_rock = rock.instantiate()
	var pos_new_rock = randi_range(18, $sky.size.x - 18)
	new_rock.global_position.y = $sky.global_position.y
	new_rock.global_position.x = pos_new_rock
	
	add_child(new_rock)


func _on_pause_pressed() -> void:
	pass # Replace with function body.
