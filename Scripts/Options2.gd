extends Control

# Signal emitted when the options menu is closed
#signal closed(_done)
@export var _done = "done"

# Signal emitted when the main menu button is pressed
signal MainMenu()

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set focus to the "Return" button when the scene is ready
	$"Return marginbox/Return".grab_focus()

	# Set slider values based on saved settings
	get_node("MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/GridContainer/MasterSlider").value = Settings._settings["buses"]["master"]
	get_node("MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/GridContainer/MusicSlider").value = Settings._settings["buses"]["music"]
	get_node("MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/GridContainer/SFXSlider").value = Settings._settings["buses"]["sfx"]
	_on_window_sizer_item_selected(Settings._settings["window"]["window_size"])
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Called when the "Return" button is pressed
func _on_return_pressed():
	#get_tree().change_scene_to_file("res://Tscns/main_menu.tscn")
	#emit_signal("closed", _done)
	#self.queue_free()
	self.hide()
	
	

# Called when the master volume slider value is changed
func _on_master_slider_value_changed(value):
	# Set the master volume based on the slider value and save the settings
	var MasterID = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(MasterID, linear_to_db(value))
	Settings._settings["buses"]["master"] = value
	Settings.save_settings()
	return true

# Called when the music volume slider value is changed
func _on_music_slider_value_changed(value):
	# Set the music volume based on the slider value and save the settings
	var MusicID = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(MusicID, linear_to_db(value))
	Settings._settings["buses"]["music"] = value
	Settings.save_settings()
	return true
	
# Called when the SFX volume slider value is changed
func _on_sfx_slider_value_changed(value):
	# Set the SFX volume based on the slider value and save the settings
	var SFXID = AudioServer.get_bus_index("SFX")
	AudioServer.set_bus_volume_db(SFXID, linear_to_db(value))
	Settings._settings["buses"]["sfx"] = value
	Settings.save_settings()
	return true

# Called when the window size option is selected
func _on_window_sizer_item_selected(index):
	match index:
		0:
			# Set window mode to windowed and save the settings
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			Settings._settings["window"]["window_size"] = 0
			Settings.save_settings()
			
		1: 
			# Set window mode to maximized and save the settings
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
			Settings._settings["window"]["window_size"] = 1
			Settings.save_settings()
	
		2: 
			# Set window mode to fullscreen and save the settings
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			Settings._settings["window"]["window_size"] = 2
			Settings.save_settings()
			
			
# Called when the button is pressed
func _on_button_pressed():
	# Emit the MainMenu signal and hide the options menu
	MainMenu.emit()
	self.hide() 
