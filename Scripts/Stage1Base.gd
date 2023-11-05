extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Score.addCombo()
	Score.addCombo()
	Score.addCombo()
	Score.addCombo()
	Score.addCombo()
	Score.addCombo()
	Score.addGauge(20)
	spawnNote("Collector1")
	spawnNote("Collector2")
	spawnNote("Collector3")
	spawnNote("Collector4")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawnNote(collector):
	get_node(collector).spawnNote()
	



