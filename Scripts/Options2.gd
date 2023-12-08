extends Control

#signal closed(_done)


@export var _done = "done"
signal MainMenu()
# Called when the node enters the scene tree for the first time.
func _ready():
	$"Return marginbox/Return".grab_focus()

	get_node("MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/GridContainer/MasterSlider").value = Settings._settings["buses"]["master"]
	get_node("MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/GridContainer/MusicSlider").value = Settings._settings["buses"]["music"]
	get_node("MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/GridContainer/SFXSlider").value = Settings._settings["buses"]["sfx"]
	_on_window_sizer_item_selected(Settings._settings["window"]["window_size"])
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_return_pressed():
	#get_tree().change_scene_to_file("res://Tscns/main_menu.tscn")
	#emit_signal("closed", _done)
	#self.queue_free()
	self.hide()
	
	


func _on_master_slider_value_changed(value):
	var MasterID = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(MasterID, linear_to_db(value))
	Settings._settings["buses"]["master"] = value
	Settings.save_settings()
	return true


func _on_music_slider_value_changed(value):
	var MusicID = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(MusicID, linear_to_db(value))
	Settings._settings["buses"]["music"] = value
	Settings.save_settings()
	return true
	
	
func _on_sfx_slider_value_changed(value):
	var SFXID = AudioServer.get_bus_index("SFX")
	AudioServer.set_bus_volume_db(SFXID, linear_to_db(value))
	Settings._settings["buses"]["sfx"] = value
	Settings.save_settings()
	return true


# Here you can manually modifiy the screen settings. The issue is it doesn't center or save your info.
func _on_window_sizer_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			Settings._settings["window"]["window_size"] = 0
			Settings.save_settings()
			
		1: 
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
			Settings._settings["window"]["window_size"] = 1
			Settings.save_settings()
	
		2: 
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			Settings._settings["window"]["window_size"] = 2
			Settings.save_settings()
			
			
			

func _on_button_pressed():
	MainMenu.emit()
	self.hide() 
