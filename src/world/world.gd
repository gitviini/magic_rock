extends Node2D

@export var rock := preload("res://src/rock/rock.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_new_rock_timeout() -> void:
	var new_rock = rock.instantiate()
	var pos_new_rock = randi_range(18, $sky.size.x - 18)
	new_rock.global_position.y = $sky.global_position.y
	new_rock.global_position.x = pos_new_rock
	
	add_child(new_rock)
