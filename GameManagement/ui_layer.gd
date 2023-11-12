extends CanvasLayer

signal load_level()
signal unload_level() 
@onready var MainMenu = %MainMenu
@onready var Options = $Options
# Called when the node enters the scene tree for the first time.
func _ready():
	#$MainMenu.connect("link_start", self, "test_print")
	# Replace with function body.
	Options.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_main_menu_link_start():
	load_level.emit()
	


func _on_main_menu_options_show():
	#MainMenu.hide()
	Options.show()
	

func _on_options_main_menu():
	unload_level.emit() 
	MainMenu.show()
