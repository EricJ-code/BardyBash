extends CanvasLayer

signal load_level()
@onready var MainMenu = %MainMenu
# Called when the node enters the scene tree for the first time.
func _ready():
	#$MainMenu.connect("link_start", self, "test_print")
	# Replace with function body.
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_main_menu_link_start():
	load_level.emit()
	

