extends Area2D

# Variable to store the Node2D to be destroyed upon collection
var body_to_destroy : Node2D = null

# Input handling function
func _input(delta):
    # Check if the "collect3" action is pressed and a body_to_destroy is assigned
	if Input.is_action_pressed("collect3") and body_to_destroy != null:
        # Queue the body_to_destroy node for removal
		body_to_destroy.queue_free()
		# Call functions to update the score and gauge
		Score.addCombo()
		Score.addGauge(1)

# Function triggered when a body enters the area
func _on_body_entered(body):
    # Assign the entered body to body_to_destroy
	body_to_destroy = body

# Function triggered when a body exits the area
func _on_body_exited(body):
    # Reset body_to_destroy when the body exits the area
	body_to_destroy = null
