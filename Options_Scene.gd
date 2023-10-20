extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Return marginbox/Return".grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_return_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
