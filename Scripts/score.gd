extends Node

var combo = 0
var gauge = 0
var multiplier = 1
signal gauge_changed
signal combo_changed


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func reset_combo():
	combo = 0
	combo_changed.emit()

func add_combo():

	combo += 1
	combo_changed.emit()

func add_guage(val):
	gauge += (val * multiplier)
	gauge_changed.emit()

func spend_guage(amt):
	if gauge>= amt:
		gauge -= amt
		gauge_changed.emit()

func increase_multiplier():
	multiplier = 2
func reset_multiplier():
	multiplier = 1


