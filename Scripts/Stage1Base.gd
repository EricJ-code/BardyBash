extends Node2D

#const UserInput = preload("res://Scripts/UserInput.cs")

# Called when the node enters the scene tree for the first time.
func _ready():
	#var UInput_method = UInput.new()
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
	



