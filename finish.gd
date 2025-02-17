extends Area3D


func _on_body_entered(body: Node3D) -> void:
	get_tree().paused = true
	$"../../Pause".show()
	$"../../Pause/Panel".hide()
	$"../../Pause/Wintex".show()
