extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SAVE_PATH = "res://config.cfg"

var _config_file = ConfigFile.new()

var _settings = {

		"buses":{"master":1,
				"music":1,
				"sfx":1},	
		"window":{"window_size":0}	
	}
"""
var _settings = {
	"keybinds":{"up":16777232,
				"left":16777231,
				"right":16777233,
				"down":16777234,
				"shoot":90,
				"spell1":88,
				"spell2":67,
				"focus":16777237,
				"swapChar":83}		
	,
		"defaultkeybinds":{"up":16777232,
				"left":16777231,
				"right":16777233,
				"down":16777234,
				"shoot":90,
				"spell1":88,
				"spell2":67,
				"focus":16777237,
				"swapChar":83},
		"buses":{"master":1,
				"music":1,
				"sfx":1},
		"window":["window_size":0]		
	}
"""	

# Called when the node enters the scene tree for the first time.
func _ready():
	load_settings()
	load_bus_volume()
	
	

func save_settings():
	for section in _settings.keys():
		for key in _settings[section]:
			_config_file.set_value(section,key,_settings[section][key])
	
	_config_file.save(SAVE_PATH)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func load_settings():
	if not DirAccess.open("res://").file_exists(SAVE_PATH):
		save_settings()
	var error = _config_file.load(SAVE_PATH)
	if error!= OK:
		print("We failed loading. Error code %s" % error)
		return []
	for section in _settings.keys():
		for key in _settings[section]:
			_settings[section][key] = _config_file.get_value(section,key,null)
	
func load_bus_volume():
	
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(_settings["buses"]["master"]))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(_settings["buses"]["music"]))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(_settings["buses"]["sfx"]))
