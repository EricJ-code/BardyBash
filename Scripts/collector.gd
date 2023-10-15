extends Node2D
# action is the keyboard action that this collect accepts
@export var action = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawnNote():
	get_node("Spawner").spawn()

func collect():
	# Use the input against the action variable.
	pass
