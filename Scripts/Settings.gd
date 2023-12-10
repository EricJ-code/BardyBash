extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Constant to store the path for saving and loading the configuration file
const SAVE_PATH = "res://config.cfg"

# Create a new ConfigFile instance
var _config_file = ConfigFile.new()

# Dictionary to store game settings
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
    # Load settings and bus volumes when the node is ready
	load_settings()
	load_bus_volume()
	
	
# Function to save the current settings to the configuration file
func save_settings():
	for section in _settings.keys():
		for key in _settings[section]:
			_config_file.set_value(section,key,_settings[section][key])
	
	_config_file.save(SAVE_PATH)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Function to load settings from the configuration file
func load_settings():
    # If the configuration file does not exist, create and save default settings
	if not DirAccess.open("res://").file_exists(SAVE_PATH):
		save_settings()

    # Attempt to load settings from the configuration file
	var error = _config_file.load(SAVE_PATH)
	if error!= OK:
		print("We failed loading. Error code %s" % error)
		return []

    # Update settings with loaded values
	for section in _settings.keys():
		for key in _settings[section]:
			_settings[section][key] = _config_file.get_value(section,key,null)
	
# Function to load bus volumes based on the loaded settings
func load_bus_volume():
    # Set audio bus volumes based on the loaded settings
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(_settings["buses"]["master"]))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(_settings["buses"]["music"]))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(_settings["buses"]["sfx"]))
