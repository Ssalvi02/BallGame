extends CanvasLayer
var options_menu_scene = preload("res://OptionsMenu.tscn")

func _ready():
	hide()
	process_mode = Node.PROCESS_MODE_ALWAYS
	$Panel/VBoxContainer/ResumeButton.pressed.connect(unpause_game)
	$Panel/VBoxContainer/MainMenuButton.pressed.connect(go_to_main_menu)
	$Panel/VBoxContainer/OptionsButton.pressed.connect(show_options)
	$Panel/VBoxContainer/QuitButton.pressed.connect(quit_game)

func unpause_game():
	get_tree().paused = false
	hide()

func go_to_main_menu():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn") 

func show_options():
	hide()
	var options_menu = options_menu_scene.instantiate()
	add_child(options_menu)

func quit_game():
	get_tree().quit()

func _input(event):
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			unpause_game()
		else:
			get_tree().paused = true
			show()
