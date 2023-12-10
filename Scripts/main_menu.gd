extends Control

# The scene to be loaded when the "Options" button is pressed
var scene = preload("res://Tscns/Options_Scene.tscn")
#@onready var Audio = $AudioStreamPlayer

# Signals emitted when certain buttons are pressed
signal link_start()
signal Options_show()

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set focus to the "Play" button when the scene is ready
	$MarginContainer/VBoxContainer/VBoxContainer2/MarginContainer/Play.grab_focus()
	#$PopupMenu.hide()'
	#Audio.play()
	#await Audio.finished
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Called when the "Play" button is pressed
func _on_play_pressed():
	# Emit the "link_start" signal and hide the current scene
	#get_tree().change_scene_to_file("res://Tscns/Stage1Visual.tscn")
	link_start.emit()
	hide()
	return true

# Called when the "Quit" button is pressed
func _on_quit_pressed():
	#Quit the game
	get_tree().quit()

# Called when the "Options" button is pressed
func _on_options_pressed():
	# Emit the "Options_show" signal and return true
	#var instance = scene.instantiate() 
	#add_child(instance)
	Options_show.emit()
	return true
