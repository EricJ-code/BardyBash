# This script extends CanvasLayer and defines signals for loading and unloading levels
extends CanvasLayer

# Signals emitted when loading and unloading levels
signal load_level()
signal unload_level() 

# References to main menu and options nodes
@onready var MainMenu = %MainMenu
@onready var Options = $Options

# Called when the node enters the scene tree for the first time.
func _ready():
	#$MainMenu.connect("link_start", self, "test_print")
	# Replace with function body.
	# Hide the options menu initially
	Options.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Function called when the main menu signals a link start
func _on_main_menu_link_start():
	load_level.emit()
	

# Function called when the main menu signals to show options
func _on_main_menu_options_show():
	#MainMenu.hide()
	#show the options menu
	Options.show()
	
# Function called when the options menu signals to go back to the main menu
func _on_options_main_menu():
    # Emit the unload_level signal and show the main menu
	unload_level.emit() 
	MainMenu.show()
