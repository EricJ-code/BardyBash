extends Node2D

signal Level_Complete()

# Called when the node enters the scene tree for the first time.
func _ready():
	Score.addCombo()
	Score.addCombo()
	Score.addCombo()
	Score.addCombo()
	Score.addCombo()
	Score.addCombo()
	Score.addGauge(20)
	pass
	
func _on_button_pressed():
	spawnNote("Collector1")
	spawnNote("Collector2")
	#spawnNote("Collector3")
	#spawnNote("Collector4")
	print(%Spawner)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawnNote(collector):
	get_node(collector).spawnNote()

func song_over(value):
	Level_Complete.emit()
	


