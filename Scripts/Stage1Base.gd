extends Node2D

signal Level_Complete()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _on_button_pressed():
	spawnNote("Collector1")
	spawnNote("Collector2")
	spawnNote("Collector3")
	spawnNote("Collector4")

func spawnNote(collector):
	get_node(collector).spawnNote()

func song_over(value):
	Level_Complete.emit()
	


