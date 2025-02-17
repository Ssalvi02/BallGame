extends CanvasLayer

func _ready():
	$Panel/VBoxContainer/Button.pressed.connect(close_options)
	$Panel/VBoxContainer/HSlider.value = SettingsManager.volume
	$Panel/VBoxContainer/HSlider2.value = SettingsManager.sensitivity

func close_options():
	SettingsManager.save_settings()
	get_parent().get_parent().show()
	get_parent().queue_free()

func _on_VolumeSlider_value_changed(value):
	SettingsManager.volume = value
	AudioServer.set_bus_volume_db(0, linear_to_db(value))

func _on_SensitivitySlider_value_changed(value):
	SettingsManager.sensitivity = value
