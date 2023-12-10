extends Node2D

# Signal emitted when the level is completed
signal Level_Complete()

# Called when the node enters the scene tree for the first time.
func _ready():
    # Add multiple combos and gauge for testing purposes
	Score.addCombo()
	Score.addCombo()
	Score.addCombo()
	Score.addCombo()
	Score.addCombo()
	Score.addCombo()
	Score.addGauge(20)
	pass
	
# Button press event handler
func _on_button_pressed():
    # Spawn notes for different collectors
	spawnNote("Collector1")
	spawnNote("Collector2")
	#spawnNote("Collector3")
	#spawnNote("Collector4")
	print(%Spawner)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Spawn a note for the specified collector
func spawnNote(collector):
	get_node(collector).spawnNote()

# Event handler for when the song is over
func song_over(value):
	Level_Complete.emit()
	


