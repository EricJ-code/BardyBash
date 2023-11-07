extends Area2D


var body_to_destroy : Node2D = null


func _input(delta):
	if Input.is_action_pressed("ui_right") and body_to_destroy != null:
		body_to_destroy.queue_free()


func _on_body_entered(body):
	body_to_destroy = body


func _on_body_exited(body):
	body_to_destroy = null
