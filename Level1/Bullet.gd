extends CharacterBody2D

#var vel= Vector2(0, 1)

var speed = 300

func _ready():
	pass

func _process(delta):
	position += transform.x * speed * delta
	#var collision_info = move_and_collide(vel.normalized() * delta * speed)
	#move_and_collide(speed * delta)

func _on_visible_on_screen_notifier_2d_screen_exited():
	Score.takeDamage(1)
	queue_free()



