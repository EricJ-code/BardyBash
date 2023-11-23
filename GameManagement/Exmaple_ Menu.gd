extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://GameManagement/ui_layer(duplicate).tscn")
#paths might have to be changes


func _on_options_pressed():
	pass


func _on_Quit_pressed():
	get_tree().quit()





# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
