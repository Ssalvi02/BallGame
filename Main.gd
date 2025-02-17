extends Node3D

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			$Pause.unpause_game()
		else:
			get_tree().paused = true
			$Pause.show()


func _on_button_pressed() -> void:
		if get_tree().paused:
			$Pause.unpause_game()
		else:
			get_tree().paused = true
			$Pause.show()


func _on_button_2_button_down() -> void:
	$Camera3D.size -= $Camera3D.zoom_sensitivity


func _on_button_3_pressed() -> void:
	$Camera3D.size += $Camera3D.zoom_sensitivity
