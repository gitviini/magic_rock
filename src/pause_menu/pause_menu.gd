extends Control


func _on_close_pressed() -> void:
	get_tree().change_scene_to_file("res://src/menu/menu.tscn")


func _on_continue_pressed() -> void:
	Global.change_pause_game.emit()
