extends Node2D

# Variables to control note movement
#var time = 0
var speed = Vector2(0,0)

# Time in seconds for the note to traverse the screen
@export var seconds = 2

# Called when the node enters the 2;0scene tree for the first time.
func _ready():
    # Calculate the speed based on the parent collector item's position
	#time = Time.get_unix_time_from_system()
	#print(speed_x)
	# Save the speed in x, y with the position of the parent collector item.
	speed = Vector2( (get_parent().get_position().x/seconds),(get_parent().get_position().y /seconds))
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# adjusts the note's position by multiplying the speed Vector 2 by the delta time function
	# This should that distance per second.
	position -= speed * delta

# Called when the note exits the screen.
func _on_visible_on_screen_notifier_2d_screen_exited():
    # Perform actions when the note leaves the screen
	# Reduce the player's gauge
	Score.spendGauge(3)
	# Reset the combo counter
	Score.resetCombo()
	# delete the note when it leaves the screen.

    # Delete the note from the scene
	queue_free()
	pass # Replace with function body.
