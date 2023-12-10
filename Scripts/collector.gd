extends Node2D

# action is the keyboard action that this collect accepts
@export var action = ""
var counter = 0

## Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Method to spawn a note using the Spawner node
func spawnNote():
	get_node("Spawner").spawn()

# Method to handle the collection action
func collect():
# Use the input against the action variable.
	pass

# Signal handler for the "area_entered" signal of the Area2D node
func _on_area_2d_area_entered(area):
	print("collide")
	
#	# Replace with function body.
#	
#
#
#
#func _on_area_2d_body_entered(body):
#	print("collide")
		
