extends Node

var combo = 0
var gauge = 0
var multiplier = 1

# Signal emitted when the gauge changes
signal gauge_changed
# Signal emitted when the combo changes
signal combo_changed


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Resets the combo to 0 and emits the combo_changed signal
func reset_combo():
	combo = 0
	combo_changed.emit()

# Increments the combo by 1 and emits the combo_changed signal
func add_combo():
	combo += 1
	combo_changed.emit()

# Adds the specified value multiplied by the current multiplier to the gauge
#Emits the gauge_changed signal
func add_guage(val):
	gauge += (val * multiplier)
	gauge_changed.emit()

# Decreases the gauge by the specified amount if it's greater than or equal to the amount
#Emits the gauge_changed signal
func spend_guage(amt):
	if gauge>= amt:
		gauge -= amt
		gauge_changed.emit()

# Sets the multiplier to 2
func increase_multiplier():
	multiplier = 2

# Sets the multiplier to 1
func reset_multiplier():
	multiplier = 1


