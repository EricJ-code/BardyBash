extends Control


var scene = preload("res://Tscns/Options_Scene.tscn")
#@onready var Audio = $AudioStreamPlayer
signal link_start()
signal Options_show()


func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer2/MarginContainer/Play.grab_focus()
	#$PopupMenu.hide()'
	#Audio.play()
	#await Audio.finished
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	#get_tree().change_scene_to_file("res://Tscns/Stage1Visual.tscn")
	link_start.emit()
	hide()
	return true


func _on_quit_pressed():
	get_tree().quit()


func _on_options_pressed():
	#var instance = scene.instantiate() 
	#add_child(instance)
	Options_show.emit()
	return true
