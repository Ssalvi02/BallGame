extends Node

var volume := 1.0:
	set(value):
		volume = clamp(value, 0.0, 1.0)

var sensitivity := 0.5:
	set(value):
		sensitivity = clamp(value, 0.1, 2.0)

const SAVE_PATH = "user://settings.cfg"

func save_settings():
	var config = ConfigFile.new()
	config.set_value("audio", "volume", volume)
	config.set_value("gameplay", "sensitivity", sensitivity)
	config.save(SAVE_PATH)

func load_settings():
	var config = ConfigFile.new()
	var err = config.load(SAVE_PATH)
	if err == OK:
		volume = config.get_value("audio", "volume", 1.0)
		sensitivity = config.get_value("gameplay", "sensitivity", 0.5)
