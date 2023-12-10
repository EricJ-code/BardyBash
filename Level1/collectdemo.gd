extends Area2D

# Variable to track the body to be destroyed on collection
var body_to_destroy : Node2D = null

# Input handling function
func _input(delta):
    # Check if the collect1 action is pressed and there is a body to destroy
	if Input.is_action_pressed("collect1") and body_to_destroy != null:
        # Queue-free the body, add combo points, and increase the gauge
		body_to_destroy.queue_free()
		Score.addCombo()
		Score.addGauge(1)

# Function called when a body enters the Area2D
func _on_body_entered(body):
	    # Set the body to be destroyed when entered
		body_to_destroy = body
	
# Function called when a body exits the Area2D
func _on_body_exited(body):
	    # Reset the body to be destroyed when exited
		body_to_destroy = null
