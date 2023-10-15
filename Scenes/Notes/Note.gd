extends Node2D

var speed_x = 0
var speed_y = 0
var seconds = 20
# Called when the node enters the 2;0scene tree for the first time.
func _ready():
	print(speed_x)

	speed_x = get_parent().get_position().x/seconds
	speed_y = get_parent().get_position().y/seconds


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position -= Vector2(speed_x*delta,speed_y*delta)

